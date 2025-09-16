# [Rustlings](https://rustlings.rust-lang.org) 🦀

Small exercises to get you used to reading and writing [Rust](https://www.rust-lang.org) code - _Recommended in parallel to reading [the official Rust book](https://doc.rust-lang.org/book) 📚️_

Visit the **website** for a demo, info about setup and more:

## ➡️ [rustlings.rust-lang.org](https://rustlings.rust-lang.org) ⬅️

## Nix

[Install Nix](https://nixos.org/guides/install-nix.html) and [enable Nix flake support](https://nixos.wiki/wiki/Flakes).

(Optional) Install [direnv](https://direnv.net).

Running `nix develop` (or `direnv allow`, if you're using `direnv`) in this repository will automatically install rust, the rustlings tool, and rust-analyzer.

If you'd like to use the `rustlings` tool elsewhere, this repository exposes it as a flake as well!

if you use vscode after `nix develop` run `code .` it will open and configures lsp rust-anlyzer
