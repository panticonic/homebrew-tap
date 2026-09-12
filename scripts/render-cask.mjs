#!/usr/bin/env node
/**
 * Render the Homebrew Cask that distributes the macOS build.
 *
 * Squirrel refuses to auto-update a build without a Developer ID signature, so
 * an ad-hoc signed app has no in-app update path and this cask is the only one
 * it has. A signed release does update itself, and then the cask has to say so:
 * `auto_updates true` tells brew the app moves on its own, so `brew upgrade`
 * stops fighting it over which version is installed.
 *
 * The release publishes which of the two it is, because a tap on a Linux runner
 * cannot inspect a macOS signature.
 *
 * Usage: render-cask.mjs <version> <dmg-path> <download-url> [signing-mode]
 */
import { createHash } from "node:crypto";
import { readFileSync } from "node:fs";
import path from "node:path";

const [version, dmgPath, downloadUrl, signingMode = "ad-hoc"] = process.argv.slice(2);
if (!version || !dmgPath || !downloadUrl) {
  console.error("usage: render-cask.mjs <version> <dmg-path> <download-url> [signing-mode]");
  process.exit(1);
}
if (signingMode !== "developer-id" && signingMode !== "ad-hoc") {
  console.error(`unknown signing mode ${signingMode}; expected developer-id or ad-hoc`);
  process.exit(1);
}
const selfUpdating = signingMode === "developer-id";

const sha256 = createHash("sha256").update(readFileSync(dmgPath)).digest("hex");

// `depends_on macos: ">= :sonoma"` mirrors electron-builder's minimumSystemVersion.
// Quarantine is left in place deliberately: an unsigned build should still be
// something the user consciously admits, not something a formula waves through.
process.stdout.write(`cask "vibestudio" do
  version "${version}"
  sha256 "${sha256}"

  url "${downloadUrl}",
      verified: "github.com/panticonic/vibestudio/"
  name "Vibestudio"
  desc "Stacked panel workspace for agentic workflows"
  homepage "https://vibestudio.app/"

  depends_on macos: ">= :sonoma"
${selfUpdating ? "\n  auto_updates true\n" : ""}
  app "Vibestudio.app"

  zap trash: [
    "~/Library/Application Support/Vibestudio",
    "~/Library/Logs/Vibestudio",
    "~/Library/Preferences/app.vibestudio.app.plist",
    "~/Library/Saved Application State/app.vibestudio.app.savedState",
  ]
end
`);
console.error(`[cask] ${path.basename(dmgPath)} sha256=${sha256}`);
