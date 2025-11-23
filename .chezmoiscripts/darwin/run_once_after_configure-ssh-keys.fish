#!/usr/bin/env fish

# I'm not using the integration from chezmoi here because I want to cleanup the things
op item get 'SSH - Work' --reveal --fields 'private key' | sed '1{/^"/d};$ {/^"/d}' >~/.ssh/work
op item get 'SSH - Work' --fields 'public key' >~/.ssh/work.pub
op item get 'SSH - Personal' --reveal --fields 'private key' | sed '1{/^"/d};$ {/^"/d}' >~/.ssh/id_rsa
op item get 'SSH - Personal' --fields 'public key' >~/.ssh/id_rsa.pub
op item get 'SSH - GetTheForkOff' --reveal --fields 'private key' | sed '1{/^"/d};$ {/^"/d}' >~/.ssh/oss
op item get 'SSH - GetTheForkOff' --fields 'public key' >~/.ssh/oss.pub
op item get 'Chef - Work' --reveal --fields 'private key' | sed '1{/^"/d};$ {/^"/d}' >~/.chef/henrique_dalssaso.pem

chmod 600 ~/.ssh/{work,id_rsa,oss}
chmod 600 ~/.chef/henrique_dalssaso.pem
