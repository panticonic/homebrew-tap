cask "vibestudio" do
  version "0.1.52"
  sha256 "1738563e130e4e1e4fa28b3fca4a3bb64b5bfd18f023542b7dfb4b53c60eff4f"

  url "https://github.com/panticonic/vibestudio/releases/download/v0.1.52/Vibestudio-0.1.52-arm64.dmg"
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
