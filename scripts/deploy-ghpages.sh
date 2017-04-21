#!/bin/bash
set -x -e

# clone repo
git clone git@github.com:$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME.git -b master $CIRCLE_PROJECT_REPONAME

cd $CIRCLE_PROJECT_REPONAME/webapp

npm install
npm run deploy
