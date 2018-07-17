#!/bin/sh
pub_to_test=$1

TMP=$(mktemp --suffix=testpub -d)
cleanup_tmp () {
  rm -Rf $TMP
}
trap cleanup_tmp EXIT

echo "Testing --pub--> $pub_to_test  <--pub--"
echo $pub_to_test > $TMP/test
ssh-keygen -l -f $TMP/test
