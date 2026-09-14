# homebrew-unshipped

Homebrew tap for [unshipped](https://github.com/Jonezzyboy/unshipped) — a desktop app
showing which of your GitHub repos have commits waiting on a release.

```sh
brew install --cask Jonezzyboy/unshipped/unshipped
```

Apple Silicon only, and you need `gh` signed in (`gh auth login`) — the app has no
login of its own.

The app is ad-hoc signed rather than notarised with an Apple Developer ID, so the cask
clears the quarantine attribute on install to stop Gatekeeper blocking first launch.

`Casks/unshipped.rb` is written by the
[release workflow](https://github.com/Jonezzyboy/unshipped/blob/main/.github/workflows/release.yml)
on every published release — edit the template in that repo, not the cask here.
