.PHONY: backup restore restore-settings install-vscode-extensions set-macos-settings

# Base directory for storing settings
SETTINGS_DIR := settings

restore: restore-settings install-vscode-extensions set-macos-settings

restore-settings:
	@echo "Restoring app settings..."

	# Karabiner
	@cp -f $(SETTINGS_DIR)/karabiner/karabiner.json ~/.config/karabiner/

	# VSCode
	@cp settings/vscode/User/settings.json ~/Library/Application\ Support/Code/User/
	@cp settings/vscode/User/keybindings.json ~/Library/Application\ Support/Code/User/ || true
	@cp -R settings/vscode/User/snippets ~/Library/Application\ Support/Code/User/ || true

	# Scroll Reverser
	@cp $(SETTINGS_DIR)/scroll-reverser/com.pilotmoon.scroll-reverser.plist ~/Library/Preferences/ || true

	# Rectangle
	@cp $(SETTINGS_DIR)/rectangle/com.knollsoft.Rectangle.plist ~/Library/Preferences/ || true

	# Sourcetree
	@cp $(SETTINGS_DIR)/sourcetree/com.torusknot.SourceTreeNotMAS.plist ~/Library/Preferences/ || true

	# iTerm2
	@cp $(SETTINGS_DIR)/iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/ || true

	# LookAway
	@cp $(SETTINGS_DIR)/lookaway/com.mysticalbits.lookaway.plist ~/Library/Preferences/ || true

	# Spotify
	@cp $(SETTINGS_DIR)/spotify/com.spotify.client.plist ~/Library/Preferences/ || true

install-vscode-extensions:
	@echo "Installing missing VSCode extensions..."
	@installed_extensions="$$(code --list-extensions)"; \
	while read -r ext; do \
		echo "$$installed_extensions" | grep -Fxq "$$ext" && \
			echo "$$ext already installed." || \
			( echo "Installing $$ext..."; code --install-extension "$$ext" ); \
	done < settings/vscode/extensions.txt

set-macos-settings:
	settings/macos/set-settings.sh

backup:
	@echo "Backing up app settings..."

	# Karabiner
	@cp -f ~/.config/karabiner/karabiner.json $(SETTINGS_DIR)/karabiner/

	# VSCode
	@cp ~/Library/Application\ Support/Code/User/settings.json settings/vscode/User/
	@cp ~/Library/Application\ Support/Code/User/keybindings.json settings/vscode/User/ || true
	@cp -R ~/Library/Application\ Support/Code/User/snippets settings/vscode/User/ || true
	@code --list-extensions > settings/vscode/extensions.txt

	# Scroll Reverser
	@cp ~/Library/Preferences/com.pilotmoon.scroll-reverser.plist $(SETTINGS_DIR)/scroll-reverser/ || true

	# Rectangle
	@cp ~/Library/Preferences/com.knollsoft.Rectangle.plist $(SETTINGS_DIR)/rectangle/ || true

	# Sourcetree
	@cp ~/Library/Preferences/com.torusknot.SourceTreeNotMAS.plist $(SETTINGS_DIR)/sourcetree/ || true

	# iTerm2
	@cp ~/Library/Preferences/com.googlecode.iterm2.plist $(SETTINGS_DIR)/iterm2/ || true

	# LookAway
	@cp ~/Library/Preferences/com.mysticalbits.lookaway.plist $(SETTINGS_DIR)/lookaway/ || true

	# Spotify
	@cp ~/Library/Preferences/com.spotify.client.plist $(SETTINGS_DIR)/spotify/ || true
