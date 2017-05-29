#!/bin/bash
pushd systemtests
sleep 20
export PATH=$PATH:/tmp/openshift
cat /etc/hosts
./scripts/run_test_travis.sh
./scripts/print_logs.sh
popd
