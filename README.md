# Vibestudio Homebrew tap

The desktop app:

```sh
brew install --cask panticonic/tap/vibestudio
brew upgrade --cask vibestudio
```

The headless server and CLI, for a machine you connect to:

```sh
brew install panticonic/tap/vibestudio-server
vibestudio remote deploy local
```

A macOS release signed with an Apple Developer ID updates itself, and the cask
says so with `auto_updates`, so `brew upgrade` leaves it alone. A release built
without those credentials is ad-hoc signed: macOS asks you to confirm it on
first launch (System Settings → Privacy & Security → Open Anyway), Squirrel
refuses to replace it, and `brew upgrade` is then the update path — which is why
this tap exists.

Both files are written by this tap's own workflow, which polls
[panticonic/vibestudio](https://github.com/panticonic/vibestudio) for releases
and the npm registry for the server package. Edit the renderers in `scripts/`,
not the generated `Casks/` and `Formula/` files.
