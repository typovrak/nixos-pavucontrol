{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.pavucontrol = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		cp ${./pavucontrol.ini} ${home}/.config/pavucontrol.ini
		chown ${username}:${group} ${home}/.config/pavucontrol.ini
		chmod 600 ${home}/.config/pavucontrol.ini
	'';
	
	environment.systemPackages = with pkgs; [
		pavucontrol
	];
}
