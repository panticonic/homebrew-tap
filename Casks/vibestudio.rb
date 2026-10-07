cask "vibestudio" do
  version "0.1.73"
  sha256 "ceaff4b5906a82c8e49e68ee857510451fc0129f268612a9ccd8b5992b68d96f"

  url "https://github.com/panticonic/vibestudio/releases/download/v0.1.73/Vibestudio-arm64.dmg"
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
