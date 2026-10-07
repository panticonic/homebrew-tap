cask "vibestudio" do
  version "0.1.68"
  sha256 "f149f439b67684f42ad900908cfc8a381965405c2e3b7890b8cd84e3a7891310"

  url "https://github.com/panticonic/vibestudio/releases/download/v0.1.68/Vibestudio-arm64.dmg"
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
