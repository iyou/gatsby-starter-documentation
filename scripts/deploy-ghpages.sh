#!/bin/bash
set -x -e

# clone repo
git clone git@github.com:$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME.git -b master $CIRCLE_PROJECT_REPONAME

cd $CIRCLE_PROJECT_REPONAME/webapp

MESSAGE=CircleCI[$CIRCLE_BUILD_NUM]:$CIRCLE_SHA1@$CIRCLE_BRANCH

npm install
COMMIT_MESSAGE=$MESSAGE npm run deploy
