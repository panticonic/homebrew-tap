cask "vibestudio" do
  version "0.1.44"
  sha256 "a0f8d8b428c5df66382b9f15d1b604c3e14db4bfd3566a134f10c06bf9dd84be"

  url "https://github.com/panticonic/vibestudio/releases/download/v0.1.44/Vibestudio-0.1.44-arm64.dmg",
      verified: "github.com/panticonic/vibestudio/"
  name "Vibestudio"
  desc "Stacked panel workspace for agentic workflows"
  homepage "https://vibestudio.app/"

  depends_on macos: ">= :sonoma"

  app "Vibestudio.app"

  zap trash: [
    "~/Library/Application Support/Vibestudio",
    "~/Library/Logs/Vibestudio",
    "~/Library/Preferences/app.vibestudio.app.plist",
    "~/Library/Saved Application State/app.vibestudio.app.savedState",
  ]
end
