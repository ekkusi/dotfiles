.PHONY: install xcode brew packages tpm

install: xcode brew packages neovim tpm

xcode:
	@echo 'Installing XCode tools...'
	@if xcode-select --install; then \
		echo "✅ XCode tools installed"; \
	else \
		echo "XCode tools already installed"; \
	fi

brew:
	@if command -v brew >/dev/null 2>&1; then \
		echo "✅ Homebrew already installed."; \
	else \
		echo "⏳ Installing Homebrew..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	fi

packages:
	@echo "Installing Homebrew packages and apps..."
	brew bundle check || brew bundle install

neovim:
	@echo "Installin Neovim..."
	bob install 0.11.3
	bob use 0.11.3

tpm:
	@if [ -d ~/.tmux/plugins/tpm ]; then \
		echo "✅ TPM is already installed!"; \
	else \
		echo "Installing TPM (Tmux Plugin Panager)..."; \
	 	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins; \
	fi