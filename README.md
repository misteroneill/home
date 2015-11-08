# misteroneill/home

My Linux/OS X user directory files/setup.

## Dependencies

- Xcode Command Line Tools + Git

## Usage

1. Clone the repository.
1. Run one/all of the scripts.

## Scripts

Each script can be run independently. Most have opposite `un` versions (e.g. `home.sh` can be reversed with `unhome.sh`).

- `brew.sh`: If the host is a Mac, set up Homebrew and key programs. Unlike other scripts, there is no `unbrew.sh` at the moment because uninstalling Homebrew is not a pretty process.
- `home.sh`: Set up important files in the `$HOME` directory.
- `node.sh`: Set up nvm, Node, and npm in various versions.
- `install.sh`: Set up a new machine (`brew.sh` + `home.sh` + `node.sh`). 
