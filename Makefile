DOTFILES_DIR := $(CURDIR)
TARGET := $(HOME)

STOW := stow
STOW_FLAGS := --target=$(TARGET) --dir=$(DOTFILES_DIR)

.PHONY: all
all: stow

.PHONY: stow
stow:
	@echo "Stowing all dotfiles"
	$(STOW) $(STOW_FLAGS) .

.PHONY: unstow
unstow:
	@echo "Unstowing all dotfiles"
	$(STOW) --delete $(STOW_FLAGS) .

.PHONY: restow
restow:
	@echo "Restowing all dotfiles"
	$(STOW) -R $(STOW_FLAGS) .

.PHONY: clean
clean:
	@echo "Cleaning up any symlinks managed by stow"
	$(STOW) --delete $(STOW_FLAGS) .

.PHONY: help
help:
	@echo "Usage:"
	@echo "  make all        # Stow all dotfiles"
	@echo "  make stow       # Stow all dotfiles"
	@echo "  make unstow     # Unstow all dotfiles"
	@echo "  make restow     # Restow all dotfiles"
	@echo "  make clean      # Remove all symlinks managed by stow"
	@echo "  make help       # Show this help message"

