#!/bin/sh

if [ ! -n "$DEPLOY_KEY_PRIVATE" ]; then
  error 'Cannot read your private key from DEPLOY_KEY_PRIVATE. Check that you have a key pair named DEPLOY_KEY in your Wercker pipeline settings'
  exit 1
fi

mkdir -p ~/.ssh
touch ~/.ssh/known_hosts
chmod 644 ~/.ssh/known_hosts
ssh-keyscan github.com "$WERCKER_SSH_CONFIG_ADDITIONAL_HOSTS" >> ~/.ssh/known_hosts
echo -e $DEPLOY_KEY_PRIVATE > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
echo -e $DEPLOY_KEY_PUBLIC > ~/.ssh/id_rsa.pub
chmod 644 ~/.ssh/id_rsa.pub
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
touch ~/.ssh/config
chmod 644 ~/.ssh/config
echo -e "ForwardAgent yes" >> ~/.ssh/config
echo -e "BatchMode yes" >> ~/.ssh/config
