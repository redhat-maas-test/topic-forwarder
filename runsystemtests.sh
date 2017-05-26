#!/bin/sh

git clone https://github.com/EnMasseProject/systemtests.git
cd systemtests
./scripts/install_openshift.sh openshift
./scripts/start_openshift.sh openshift
export PATH=$PATH:openshift
sleep 20
cat /etc/hosts
./scripts/run_test_travis.sh
./scripts/print_logs.sh
