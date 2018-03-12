help: ## Print this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: config && brew && cask && link && shell && mas ## This calls all commands in a reasonable order

brew: ## Install Homebrew + packages
	- which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	- brew tap caskroom/versions && brew tap caskroom/fonts
	- cat Brewfile | sed 's/#.*$$//g' | grep -v '^$$' | xargs -n1 brew install
	
cask: ## Install software from brew cask
	- cat Caskfile | xargs -n1 brew cask install
	
config: ## Sets macOS defaults to my preferences
	- bash ./defaults

link: ## Link .* to $HOME
	find $(CURDIR) -name ".*" -type f -exec ln -sF {} ~/ ';'

mas:
	bash ./masfile

shell:
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

.PHONY: help brew link
