#!/bin/sh
pushd systemtests
sleep 20
cat /etc/hosts
./scripts/run_test_travis.sh
./scripts/print_logs.sh
popd
