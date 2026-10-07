cask "vibestudio" do
  version "0.1.79"
  sha256 "837164a237fce73ad5b941a450f8269b928c6ebfe83b7e6f655dca6f90de8843"

  url "https://github.com/panticonic/vibestudio/releases/download/v0.1.79/Vibestudio-arm64.dmg"
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
