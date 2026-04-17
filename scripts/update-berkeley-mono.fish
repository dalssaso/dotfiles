#!/usr/bin/env fish

# Refresh the Berkeley Mono zip stored in 1Password from a freshly-downloaded release.
# Usage: ./scripts/update-berkeley-mono.fish <path-to-folder-or-zip>

if test (count $argv) -ne 1
    echo "Usage: "(status filename)" <path-to-release-folder-or-zip>"
    exit 2
end

set -l input $argv[1]

if not test -e $input
    echo "Path does not exist: $input"
    exit 1
end

if not command -q op
    echo "1Password CLI (op) not found."
    exit 1
end

set -l work_dir (mktemp -d -t berkeley-mono-update.XXXXXX)
set -l flat_dir "$work_dir/flat"
mkdir -p $flat_dir

set -l search_root $input

if string match -qr '\.zip$' -- $input
    set search_root "$work_dir/unzipped"
    mkdir -p $search_root
    unzip -q $input -d $search_root
end

for otf in (find $search_root -type f -name '*.otf')
    cp $otf $flat_dir/
end

# Validate expected set.
# If Berkeley Graphics renames files in a future release, update this list.
set -l expected BerkeleyMono-Regular.otf BerkeleyMono-Bold.otf BerkeleyMono-Oblique.otf BerkeleyMono-Bold-Oblique.otf
set -l missing
for name in $expected
    if not test -f "$flat_dir/$name"
        set -a missing $name
    end
end

set -l found_count (count $flat_dir/*.otf)

if test (count $missing) -gt 0
    echo "Missing expected font files: $missing"
    echo "Found $found_count .otf file(s) in $input"
    rm -rf $work_dir
    exit 1
end

if test $found_count -ne 4
    echo "Expected exactly 4 .otf files, found $found_count"
    rm -rf $work_dir
    exit 1
end

set -l out_zip "$work_dir/berkeley-mono.zip"
pushd $flat_dir >/dev/null
zip -j $out_zip $expected
popd >/dev/null

echo "Uploading to 1Password..."
if not op document edit "Berkeley Mono Font" --vault Personal $out_zip --file-name berkeley-mono.zip
    echo "op document edit failed."
    rm -rf $work_dir
    exit 1
end

rm -rf $work_dir

echo ""
echo "Done. On other machines, run:"
echo "    rm ~/Library/Fonts/BerkeleyMono-*.otf && chezmoi apply"
