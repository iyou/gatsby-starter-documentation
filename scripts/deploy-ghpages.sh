#!/bin/bash
set -x -e
git clone git@github.com:$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME.git -b master knotel-docs
cd docs/webapp
npm install
gatsby build
cd ../..
mkdir -p docs
cp -rf knotel-docs/webapp/public/* docs/
cd knotel-docs
git checkout gh-pages
git rm -rf .
cp -a ../docs/* .
git config --global user.email "$GH_EMAIL" > /dev/null 2>&1
git config --global user.name "$GH_NAME" > /dev/null 2>&1
git add -A
git commit -m "Deploy to GitHub pages: $CIRCLE_BUILD_NUM [ci skip]"
git push --force --quiet origin gh-pages
