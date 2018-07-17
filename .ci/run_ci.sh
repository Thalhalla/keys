#!/bin/sh

pwd
this_pwd=$(pwd)
if [ ! -e "/usr/local/bin/bats" ]; then git clone https://github.com/sstephenson/bats.git && cd bats && sudo  ./install.sh /usr/local ; fi
cd $this_pwd
bats .ci/tests.bats
