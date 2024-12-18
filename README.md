<!-- LOGO -->
<div align="center">
  <img align="center" src=".github/media/logo.png?raw=true" alt="Logo" width="200">
</div>

<h1 align="center">
  <a name="top" title="dotfiles">Demartini’s dotfiles</a><br/>
  <sup><sub>powered by <a href="https://www.chezmoi.io/">chezmoi</a></sub></sup>
</h1>

<!-- SHIELDS -->
<div align="center">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]

</div>

<!-- TABLE OF CONTENTS -->
## Table of Contents <!-- omit in toc -->

- [About](#about)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [Changelog](#changelog)
- [Credits](#credits)
- [License](#license)

<!-- ABOUT -->
## About

This repository contains my personal dotfiles managed by [chezmoi](https://www.chezmoi.io/), which allows for efficient setup and synchronization of my preferred development environment across multiple machines.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

To set up your environment with this repository’s dotfiles, run the following command:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/demartini/dotfiles/main/install.sh)"
```

This script automates the installation and configuration of essential tools for managing your dotfiles.

- **Xcode Command Line Tools** - Development tools for macOS.
- **Homebrew**: A package manager for macOS and Linux.
- **Fish Shell**: A user-friendly, interactive shell.
- **Fisher**: Plugin manager for Fish shell.
- **chezmoi**: A dotfiles manager to manage and synchronize your dotfiles.
- **age**: A simple, modern, and secure file encryption tool.

Clone the dotfiles repository:

```sh
git clone https://github.com/demartini/dotfiles.git ~/.dotfiles
```

Initialize chezmoi:

```sh
chezmoi init --source="$HOME/.dotfiles" --apply
```

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

If you are interested in helping contribute, please take a look at our [contribution guidelines][contributing-url] and open an [issue][issues-url] or [pull request][pull-request-url].

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CHANGELOG -->
## Changelog

See [CHANGELOG][changelog-url] for a human-readable history of changes.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CREDITS -->
## Credits

<!--- cSpell:disable --->
- [Mathias Bynens](https://github.com/mathiasbynens) and his [dotfiles](https://github.com/mathiasbynens/dotfiles).
- [Mike Greiling](https://github.com/mikegreiling) and his [dotfiles](https://github.com/mikegreiling/dotfiles).
- [Nhan Pham](https://github.com/Nitestack) and his [dotfiles](https://github.com/Nitestack/dotfiles).
- [Rust84](https://github.com/rust84) and his [dotfiles](https://github.com/rust84/dotfiles).
- [Tom Payne](https://github.com/twpayne) the creator of [chezmoi](https://www.chezmoi.io).

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See [LICENSE][license-url] for more information.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[changelog-url]: https://github.com/demartini/dotfiles/blob/main/CHANGELOG.md
[contributing-url]: https://github.com/demartini/.github/blob/main/CONTRIBUTING.md
[pull-request-url]: https://github.com/demartini/dotfiles/pulls

[contributors-shield]: https://img.shields.io/github/contributors/demartini/dotfiles.svg?style=for-the-badge&color=8bd5ca&labelColor=181926
[contributors-url]: https://github.com/demartini/dotfiles/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/demartini/dotfiles.svg?style=for-the-badge&color=8bd5ca&labelColor=181926
[forks-url]: https://github.com/demartini/dotfiles/network/members
[issues-shield]: https://img.shields.io/github/issues/demartini/dotfiles.svg?style=for-the-badge&color=8bd5ca&labelColor=181926
[issues-url]: https://github.com/demartini/dotfiles/issues
[license-shield]: https://img.shields.io/github/license/demartini/dotfiles.svg?style=for-the-badge&color=8bd5ca&labelColor=181926
[license-url]: https://github.com/demartini/dotfiles/blob/main/LICENSE
[stars-shield]: https://img.shields.io/github/stars/demartini/dotfiles.svg?style=for-the-badge&color=8bd5ca&labelColor=181926
[stars-url]: https://github.com/demartini/dotfiles/stargazers
