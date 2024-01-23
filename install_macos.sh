DIR_CURRENT=$(realpath $(dirname "$0"))

echo "- current directory: ${DIR_CURRENT}"

echo "- installing macos dependencies"
brew install starship
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

echo "- creating directories"
mkdir -p \
    "${HOME}/.config" \
    "${HOME}/.config/Code" \
    "${HOME}/.config/Code/User" \
    "${HOME}/.config/helix" \
    "${HOME}/.config/helix/themes"

FILES=( \
    "bash_aliases" \
    "gdbinit" \
    "gitattributes" \
    "gitconfig" \
    "gitignore" \
    "config/starship.toml" \
    "config/Code/User/settings.json" \
    "config/helix/config.toml" \
    "config/helix/languages.toml" \
    "tmux.conf" \
    "vimrc" \
)

echo "- linking dotfiles"
for FILE in ${FILES[@]}; do
    rm "${HOME}/${FILE}"
    ln -s "${DIR_CURRENT}/${FILE}" "${HOME}/.${FILE}"
done

echo "- installing themes"
git clone "https://github.com/CptPotato/helix-themes.git" "${HOME}/.config/helix/themes"
