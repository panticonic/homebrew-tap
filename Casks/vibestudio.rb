cask "vibestudio" do
  version "0.1.106"
  sha256 "be9386ea3f1ad38893fd77c8ff04663d84b5316d7da77ce12f4dc902edcc8f29"

  url "https://github.com/panticonic/vibestudio/releases/download/v0.1.106/Vibestudio-arm64.dmg"
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
