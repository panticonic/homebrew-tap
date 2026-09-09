# Vibestudio Homebrew tap

```sh
brew install --cask panticonic/tap/vibestudio
brew upgrade --cask vibestudio
```

The macOS build is ad-hoc signed rather than signed with an Apple Developer ID,
so macOS will ask you to confirm it on first launch (System Settings → Privacy &
Security → Open Anyway). That also means the app cannot update itself: `brew
upgrade` is the update path, which is why this tap exists.

`Casks/vibestudio.rb` is written by the release workflow in
[panticonic/vibestudio](https://github.com/panticonic/vibestudio); edit it there,
not here.
