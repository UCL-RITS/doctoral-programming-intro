
#!/bin/bash
set -e

if [[ $TRAVIS_PULL_REQUEST == false && $TRAVIS_BRANCH == 'master' ]]; then

    openssl aes-256-cbc -K $encrypted_4014292b586d_key -iv $encrypted_4014292b586d_iv -in travis/secrets.tar.enc -out secrets.tar -d
    tar -xvf secrets.tar
    REPO=`git config remote.origin.url`
    SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
    eval `ssh-agent -s`
    chmod 600 deploy_key
    ssh-add deploy_key

    cd _site
    git init
    git checkout -b gh-pages
    git config --global user.email "jamespjh@gmail.com"
    git config --global user.name "Pushed by Travis CI"
    git add .
    git commit -m "Pushed by Travis"
    git remote add origin $SSH_REPO
    git push -f -u origin gh-pages

fi

