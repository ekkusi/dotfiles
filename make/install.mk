.PHONY: install xcode brew packages

install: xcode brew packages

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
