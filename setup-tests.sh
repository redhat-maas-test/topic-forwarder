#!/bin/bash
git clone https://github.com/EnMasseProject/systemtests.git
pushd systemtests
echo "Current dir 1 $PWD"
./scripts/install_openshift.sh /tmp/openshift
echo "Current dir 2 $PWD"
./scripts/start_openshift.sh /tmp/openshift
echo "Current dir 3 $PWD"
popd
echo "Current dir 4 $PWD"
