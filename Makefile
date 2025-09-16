.PHONY: update rebuild

update:
	nix flake update

rebuild:
	sudo nixos-rebuild switch --flake .

