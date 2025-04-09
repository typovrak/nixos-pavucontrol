# nixos-pavucontrol

nixos-pavucontrol = fetchGit {
	url = "https://github.com/typovrak/nixos-pavucontrol.git";
	ref = "main";
};

(import "${nixos-pavucontrol}/configuration.nix")
