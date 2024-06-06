#!/usr/bin/env fish

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

source $HOME/.asdf/asdf.fish

for i in (cat .tool-versions)
    set -l plugin (echo $i | cut -d " " -f1)
    asdf plugin add $plugin
end

cd $HOME
asdf install
