# homebrew-unshipped

Homebrew tap for [unshipped](https://github.com/Jonezzyboy/unshipped) — a desktop app
showing which of your GitHub repos have commits waiting on a release.

```sh
brew install --cask --no-quarantine Jonezzyboy/unshipped/unshipped
```

`--no-quarantine` is needed because the app is ad-hoc signed rather than notarised
with an Apple Developer ID. Without it macOS Gatekeeper blocks the first launch.

`Casks/unshipped.rb` is written by the
[release workflow](https://github.com/Jonezzyboy/unshipped/blob/main/.github/workflows/release.yml)
on every published release — edit the template in that repo, not the cask here.
