#!/bin/bash
TMP=$(mktemp -d --suffix=KEYSTER)
KEY_URL=https://raw.githubusercontent.com/Thalhalla/keys/master/keys

if [ -d "$HOME/.ssh" ]
then
    echo 'ssh dir exists, proceeding...'
else
    echo 'ssh dir does not exist, generating it with "ssh-keygen -t ecdsa"'
    ssh-keygen -b 521 -N "" -t ecdsa -f $HOME/.ssh/id_ecdsa
fi
echo 'This is for Webhosting.coop dev only, this will add our keys to your server, BEWARE!'
touch $HOME/.ssh/authorized_keys
cp $HOME/.ssh/authorized_keys $TMP/mysshauthorized_keys
curl --silent $KEY_URL |xargs -n1 -I{} echo '{}'>> $TMP/mysshauthorized_keys
cat $TMP/mysshauthorized_keys|sort|uniq>$TMP/mysshauthorized_keysuniq
rm $TMP/mysshauthorized_keys
diff $TMP/mysshauthorized_keysuniq $HOME/.ssh/authorized_keys
cp $TMP/mysshauthorized_keysuniq $HOME/.ssh/authorized_keys
rm $TMP/mysshauthorized_keysuniq
rm -Rf $TMP
