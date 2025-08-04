include make/install.mk # install
include make/settings.mk # backup restore

.PHONY: setup link complete

setup: link install restore complete 

link:
	@echo "Linking dotfiles with Dotbot..."
	dotbot -c install.conf.yaml

complete:
	@echo ""
	@echo "✅ Setup complete!"

