brew_setup () {
	which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
	brew bundle
}

config_setup () {
	bash ~/.dotfiles/defaults
}

link_setup () {
	find $(PWD) -name ".*" -type f -exec ln -sF {} ~/ ';'
}

oh-my-zsh () {
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

brew_setup
config_setup
link_setup
oh-my-zsh