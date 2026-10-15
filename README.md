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

Both files are written atomically by this tap's own workflow. It resolves one
complete public [Vibestudio release](https://github.com/panticonic/vibestudio),
requires that release's checksum and signing records, and pins the server
formula to the same exact version from npm. An exact version can be dispatched
as soon as a release is public; the hourly schedule reconciles any missed
dispatch. Edit the renderers in `scripts/`, not the generated `Casks/` and
`Formula/` files.
