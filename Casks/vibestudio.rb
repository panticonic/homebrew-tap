cask "vibestudio" do
  version "0.1.78"
  sha256 "91c58f9df0b0766ec97d5d2e7bfc6cab5f7d6093849a4569feced3dc19bbaefc"

  url "https://github.com/panticonic/vibestudio/releases/download/v0.1.78/Vibestudio-arm64.dmg"
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
