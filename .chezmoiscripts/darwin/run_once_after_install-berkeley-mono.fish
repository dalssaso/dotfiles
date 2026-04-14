#!/usr/bin/env fish

set -l tag "[berkeley-mono]"
set -l font_dir "$HOME/Library/Fonts"
set -l marker "$font_dir/BerkeleyMono-Regular.otf"

if test -f $marker
    echo "$tag already installed, skipping."
    exit 0
end

if not command -q op
    echo "$tag 1Password CLI (op) not found — skipping install."
    exit 0
end

set -l tmp_zip (mktemp -t berkeley-mono.XXXXXX.zip)

echo "$tag fetching font from 1Password (may prompt for auth)..."
if not op document get "Berkeley Mono Font" --vault Personal --out-file $tmp_zip --force
    echo "$tag failed to fetch from 1Password — skipping install."
    rm -f $tmp_zip
    exit 0
end

mkdir -p $font_dir
if not unzip -oq $tmp_zip -d $font_dir
    echo "$tag unzip failed — install aborted."
    rm -f $tmp_zip
    exit 1
end
rm -f $tmp_zip

echo "$tag installed to $font_dir"
