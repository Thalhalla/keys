#!/bin/bash
TMP=mktemp -d
cd $TMP
echo 'This is for Thalhalla dev only, this will add our keys to your server, BEWARE!'
touch /root/.ssh/authorized_keys
cp /root/.ssh/authorized_keys $TMP/rootsshauthorized_keys
wget --quiet -c https://raw.githubusercontent.com/Thalhalla/keys/master/keys
cat keys |xargs -n1 -I{} echo '{}'>> $TMP/rootsshauthorized_keys
cat $TMP/rootsshauthorized_keys|sort|uniq>$TMP/rootsshauthorized_keysuniq
rm $TMP/rootsshauthorized_keys
echo 'I will be adding these entries (removing duplicates):'
diff $TMP/rootsshauthorized_keysuniq /root/.ssh/authorized_keys
echo -n 'ctrl-C to stop now! or forever hold your peace'
#sleep 1;echo -n '.';sleep 1;echo -n '.';sleep 1;echo -n '.';sleep 1;echo -n '.'
#sleep 1
cp $TMP/rootsshauthorized_keysuniq /root/.ssh/authorized_keys
rm $TMP/rootsshauthorized_keysuniq
