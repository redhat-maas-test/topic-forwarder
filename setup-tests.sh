#!/bin/bash
git clone https://github.com/EnMasseProject/systemtests.git
pushd systemtests
./scripts/install_openshift.sh openshift
./scripts/start_openshift.sh openshift
popd
