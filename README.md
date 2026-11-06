# glpecile/tap

The Homebrew tap for [hachikuji](https://github.com/glpecile/hachikuji), an IDE-style completion popup for zsh that uses almost no memory.

```sh
brew install glpecile/tap/hachikuji
```

Then add the line that `hachikuji init zsh` prints to `~/.zshrc`, before zsh-syntax-highlighting. Update with `brew upgrade hachikuji`.

## What this repository is

A tap is a Git repository of Homebrew formulas that is not homebrew-core. This one holds one formula, [`Formula/hachikuji.rb`](Formula/hachikuji.rb). On macOS (arm64 or x86_64), the formula:

1. Downloads the prebuilt archive of a [hachikuji release](https://github.com/glpecile/hachikuji/releases) and checks its SHA-256.
2. Installs `bin/hachikuji`, and puts `hachikuji.zsh`, `specs.idx` and `FIG-LICENSE` in `$(brew --prefix)/share/hachikuji/`.

It builds nothing, so you do not need Rust or Bun. Linux is not supported here: use the [install script](https://github.com/glpecile/hachikuji#install).

## Use the full name

Run `brew install glpecile/tap/hachikuji` as one command. It adds this tap and trusts the formula. Homebrew 7 does not load formulas from an untrusted tap, so `brew tap glpecile/tap` followed by `brew install hachikuji` fails. To fix that, run `brew trust --formula glpecile/tap/hachikuji`.

## Why a tap

homebrew-core accepts a project only when it is [notable and at least 30 days old](https://docs.brew.sh/Package-Acceptance-Policy). hachikuji is not there yet. When it is, the formula moves to homebrew-core.

## Do not edit the formula here

`make release` in the hachikuji repository writes this file from [`packaging/homebrew/hachikuji.rb.in`](https://github.com/glpecile/hachikuji/blob/main/packaging/homebrew/hachikuji.rb.in), with the version, the URLs and the checksums. Change the template there. The release steps are in [docs/RELEASING.md](https://github.com/glpecile/hachikuji/blob/main/docs/RELEASING.md).
