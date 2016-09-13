# misteroneill/home

My Linux/OS X user directory files/setup.

## Dependencies

- Xcode Command Line Tools + Git

## Usage

1. Clone the repository.
1. Run one/all of the scripts.

## Scripts

Each script can be run independently. Most have opposite `un` versions (e.g. `dotfiles.sh` can be reversed with `undotfiles.sh`).

- `brew.sh`: If the host is a Mac, set up Homebrew and key programs. Unlike other scripts, there is no `unbrew.sh` at the moment because uninstalling Homebrew is not a pretty process.
- `dotfiles.sh`: Set up important files in the `$HOME` directory.
- `node.sh`: Set up nvm, Node, and npm in various versions.
- `sublime.sh`: Depends on `node` 4.4+ being installed (which `node.sh` does). Sets up platform-specific defaults for Sublime Text 3. _It is best for ST3 and Package Control to be installed before-hand!_
- `install.sh`: Set up a new machine (`brew.sh` + `dotfiles.sh` + `node.sh` + `sublime.sh`).
