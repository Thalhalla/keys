#!/bin/bash
echo 'This is for Thalhalla dev only, this will add our keys to your server, BEWARE!'
touch /root/.ssh/authorized_keys
cp /root/.ssh/authorized_keys /tmp/rootsshauthorized_keys
curl https://raw.githubusercontent.com/Thalhalla/keys/master/keys |xargs -n1 -I{} echo '{}'>> /tmp/rootsshauthorized_keys
cat /tmp/rootsshauthorized_keys|sort|uniq>/tmp/rootsshauthorized_keysuniq
rm /tmp/rootsshauthorized_keys
echo 'I will be adding these entries (removing duplicates):'
diff /tmp/rootsshauthorized_keysuniq /root/.ssh/authorized_keys
echo -n 'ctrl-C to stop now! or forever hold your peace'
sleep 1;echo -n '.';sleep 1;echo -n '.';sleep 1;echo -n '.';sleep 1;echo -n '.'
sleep 1
cp /tmp/rootsshauthorized_keysuniq /root/.ssh/authorized_keys
rm /tmp/rootsshauthorized_keysuniq
