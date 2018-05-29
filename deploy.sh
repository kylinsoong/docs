#!/bin/bash
echo "--------------------------------------"
echo "Deploy Document"
echo "--------------------------------------"
echo ""

DOCUMENT_VERSION_CURRENT=2018
DOCUMENT_VERSION=$1

echo "Check out to branch gh-pages"
git checkout gh-pages

if [ -z != $DOCUMENT_VERSION ]
then
echo "Document version is $DOCUMENT_VERSION"
else
DOCUMENT_VERSION=$DOCUMENT_VERSION_CURRENT
echo "Document version is null, use default $DOCUMENT_VERSION"
fi

gitbook build ./ $DOCUMENT_VERSION

echo "Push to Github"

git status
echo "Add all"
git add --all
echo "Commit"
git commit -m "CI Deploying"
echo "pushing"
git push origin gh-pages
echo "Check out to master"
git checkout master
