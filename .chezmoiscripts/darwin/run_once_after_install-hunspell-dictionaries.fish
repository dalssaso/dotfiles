#!/usr/bin/env fish
# Install hunspell dictionaries for spell checking
# Dictionaries: en_US, en_GB, pt_BR

set DICT_DIR "$HOME/Library/Spelling"
mkdir -p "$DICT_DIR"

# LibreOffice dictionaries repository (raw files)
set BASE_URL "https://raw.githubusercontent.com/LibreOffice/dictionaries/master"

echo "Installing hunspell dictionaries to $DICT_DIR..."

# Function to download dictionary if not exists
function download_dict
    set lang $argv[1]
    set path $argv[2]

    if test -f "$DICT_DIR/$lang.dic" -a -f "$DICT_DIR/$lang.aff"
        echo "  $lang: already installed"
        return 0
    end

    echo "  $lang: downloading..."
    curl -sL "$BASE_URL/$path/$lang.dic" -o "$DICT_DIR/$lang.dic"
    curl -sL "$BASE_URL/$path/$lang.aff" -o "$DICT_DIR/$lang.aff"
    echo "  $lang: installed"
end

# Download dictionaries
download_dict "en_US" "en"
download_dict "en_GB" "en"
download_dict "pt_BR" "pt_BR"

echo "Hunspell dictionaries installed successfully!"
echo "Available dictionaries:"
hunspell -D 2>&1 | grep -E "^/" | head -10; or true
