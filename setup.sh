brew_setup () {
	which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" && \
	brew tap homebrew/cask-versions && brew tap homebrew/cask-fonts && \
	cat Brewfile | sed 's/#.*$$//g' | grep -v '^$$' | xargs -n1 brew install
}

cask_setup () {
	cat Caskfile | xargs -n1 brew cask install
}

config_setup () {
	bash ~/.dotfiles/defaults
}

link_setup () {
	find $(PWD) -name ".*" -type f -exec ln -sF {} ~/ ';'
}

mas_install () {
	which mas && bash ./masfile
}

oh-my-zsh () {
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

brew_setup
cask_setup
config_setup
link_setup
mas_install
oh-my-zsh