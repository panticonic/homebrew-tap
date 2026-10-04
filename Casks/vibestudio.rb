cask "vibestudio" do
  version "0.1.55"
  sha256 "b0993634302cd747e0635e4a96a272ea079ae756a01ad6de9a5870e7314e75c0"

  url "https://github.com/panticonic/vibestudio/releases/download/v0.1.55/Vibestudio-0.1.55-arm64.dmg"
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
