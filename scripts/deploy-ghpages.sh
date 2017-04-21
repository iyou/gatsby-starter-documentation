#!/bin/bash
set -x -e

# clone repo
git clone git@github.com:$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME.git -b master $CIRCLE_PROJECT_REPONAME

# set account identity
git config --global user.email "longliangyou@gmail.com"
git config --global user.name "CircleCI"

cd $CIRCLE_PROJECT_REPONAME/webapp

npm install

MESSAGE="CircleCI[$CIRCLE_BUILD_NUM]: $CIRCLE_SHA1@$CIRCLE_BRANCH [ci skip]"
COMMIT_MESSAGE="$MESSAGE" npm run deploy
