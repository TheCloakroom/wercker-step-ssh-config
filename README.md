# wercker-step-ssh-config
A Wercker step to set up the SSH dotfiles and the SSH forwarding agent based on your DEPLOY_KEY

It also adds github.com to your known hosts file.

Using this step and adding your DEPLOY_KEY public key to your github team you can pull code at build and at deploy. 

This allows git cloning and using any other tool that invokes ssh (like pip install with git based requirements)
