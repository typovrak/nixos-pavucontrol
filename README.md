# 🎧 NixOS Pavucontrol

> Declarative NixOS module to deploy and manage per-user Pavucontrol configuration with secure permissions.

## 📦 Features

- 🔒 **Secure config directory :** Creates ```~/.config``` with ```700``` permissions and correct ownership.

- ⚙️ **Config deployment :** Installs ```pavucontrol.ini``` into ```~/.config``` with ```600``` permissions.

- 📦 **Package installation :** Ensures ```pavucontrol``` is available in ```environment.systemPackages```.

- 🔄 **Idempotent :** Safe to run on every ```nixos-rebuild``` without overwriting existing settings.

- 💾 **Backup guidance :** Documentation includes commands to back up any existing ```pavucontrol.ini```.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/pavucontrol.ini{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-pavucontrol = fetchGit {
    url = "https://github.com/typovrak/nixos-pavucontrol.git";
    ref = "main";
    rev = "b4a9c5893dc9b25a133c3170182ef92a89defb82"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-pavucontrol}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

Launch ```pavucontrol``` in a terminal or with the dmenu in i3 to adjust audio settings.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
