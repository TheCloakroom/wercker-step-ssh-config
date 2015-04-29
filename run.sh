if [ ! -n "$DEPLOY_KEY" ]; then
  error 'Please add a DEPLOY_KEY to your Wercker pipeline keys'
  exit 1
fi

if [ ! -n "$DEPLOY_KEY_PRIVATE" ]; then
  error 'Cannot find your private key from DEPLOY_KEY_PRIVATE, check your Wercker pipeline setup'
  exit 1
fi

mkdir -p ~/.ssh
touch ~/.ssh/known_hosts
chmod 644 ~/.ssh/known_hosts
echo -e $DEPLOY_KEY_PRIVATE > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
touch ~/.ssh/config
chmod 644 ~/.ssh/config
echo -e "ForwardAgent yes" >> ~/.ssh/config
