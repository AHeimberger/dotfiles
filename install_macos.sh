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

echo "- installing helix theme"
git clone "https://github.com/CptPotato/helix-themes.git" "${HOME}/.config/helix/themes"

echo "- installing vim plugins"
rm -rf ${HOME}/.vim
mkdir -p ${HOME}/.vim/autoload ${HOME}/.vim/bundle ${HOME}/.vim/colors
curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -O pathogen.vim
mv pathogen.vim ${HOME}/.vim/autoload/pathogen.vim
git clone https://github.com/scrooloose/nerdtree.git ${HOME}/.vim/bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ${HOME}/.vim/bundle/nerdtree-git-plugin
git clone https://github.com/vim-syntastic/syntastic.git ${HOME}/.vim/bundle/syntastic
git clone https://github.com/airblade/vim-gitgutter.git ${HOME}/.vim/bundle/vim-gitgutter
git clone https://github.com/tpope/vim-fugitive.git ${HOME}/.vim/bundle/vim-fugitive
git clone git@github.com:zsoltf/vim-maui.git ${HOME}/vim-maui
mv ${HOME}/vim-maui/colors/maui.vim ${HOME}/.vim/colors/
rm -rf ${HOME}/vim-maui
