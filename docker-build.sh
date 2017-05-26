#!/bin/sh
set -x 
echo "CURRENT DIR: $PWD"
# Assumes that COMMIT, DOCKER_USER and DOCKER_PASS to be set
REPO=$1
DIR=$2
VERSION=${3:-"latest"}

if [ -n "$TRAVIS_TAG" ]
then
    VERSION="$TRAVIS_TAG"
fi

echo "DIR IS $DIR"

pwd

docker build --build-arg version=$VERSION -t $REPO:$COMMIT -f $DIR/Dockerfile || exit 1

if [ "$TRAVIS_BRANCH" == "master" ] || [ -n "$TRAVIS_TAG" ]
then
    docker login -u $DOCKER_USER -p $DOCKER_PASS || exit 1
    docker tag $REPO:$COMMIT $REPO:travis-$TRAVIS_BUILD_NUMBER || exit 1
    docker push $REPO || exit 1
fi
