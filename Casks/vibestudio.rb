cask "vibestudio" do
  version "0.1.50"
  sha256 "9e805496291a703f35a27de42f3dbe86c310cbb895fb77838ed0e7ca33ea3f8e"

  url "https://github.com/panticonic/vibestudio/releases/download/v0.1.50/Vibestudio-0.1.50-arm64.dmg"
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
