#!/usr/bin/env fish

# I'm not using the integration from chezmoi here because I want to cleanup the things
op item get 'SSH - Work' --reveal --fields 'private key' | sed '1{/^"/d};$ {/^"/d}' >~/.ssh/work
op item get 'SSH - Work' --fields 'public key' >~/.ssh/work.pub
op item get 'SSH - Personal' --reveal --fields 'private key' | sed '1{/^"/d};$ {/^"/d}' >~/.ssh/id_rsa
op item get 'SSH - Personal' --fields 'public key' >~/.ssh/id_rsa.pub

chmod 600 ~/.ssh/{work,id_rsa}
