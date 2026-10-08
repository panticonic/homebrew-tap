cask "vibestudio" do
  version "0.1.83"
  sha256 "7cc89b9521e7560036d5fac016c62c863b14957518a72cfca2e74f625aac76b4"

  url "https://github.com/panticonic/vibestudio/releases/download/v0.1.83/Vibestudio-arm64.dmg"
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
