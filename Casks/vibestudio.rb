cask "vibestudio" do
  version "0.1.105"
  sha256 "e8ed3e529dd3dbf2b5a67d11938db991591cedf6e555f2582477f6f049d577ae"

  url "https://github.com/panticonic/vibestudio/releases/download/v0.1.105/Vibestudio-arm64.dmg"
  name "Vibestudio"
  desc "Stacked panel workspace for agentic workflows"
  homepage "https://vibestudio.app/"

  depends_on macos: :sonoma

  app "Vibestudio.app"

  zap trash: [
    "~/Library/Application Support/Vibestudio",
    "~/Library/Logs/Vibestudio",
    "~/Library/Preferences/app.vibestudio.app.plist",
    "~/Library/Saved Application State/app.vibestudio.app.savedState",
  ]
end
