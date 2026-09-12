#!/usr/bin/env node
/**
 * Render the Homebrew formula that installs the headless server and CLI.
 *
 * The desktop app is a cask; this is the other half — the server a person runs
 * on a machine they connect to. It installs the published npm package rather
 * than a tarball of its own, because that package resolves the host's own
 * native dependencies (node-pty, esbuild, ripgrep's fetched binary) instead of
 * carrying every platform's copy.
 *
 * Usage: render-server-formula.mjs <version> <tarball-url> <sha256>
 */
const [version, tarballUrl, sha256] = process.argv.slice(2);
if (!version || !tarballUrl || !sha256) {
  console.error("usage: render-server-formula.mjs <version> <tarball-url> <sha256>");
  process.exit(1);
}
if (!/^[0-9]+\.[0-9]+\.[0-9]+/u.test(version)) {
  console.error(`unexpected version ${version}`);
  process.exit(1);
}
if (!/^[0-9a-f]{64}$/u.test(sha256)) {
  console.error("sha256 must be the registry's own 64-character digest");
  process.exit(1);
}

process.stdout.write(`class VibestudioServer < Formula
  desc "Headless Vibestudio server and CLI"
  homepage "https://vibestudio.app/"
  url "${tarballUrl}"
  sha256 "${sha256}"
  license "MIT"

  # The server builds workspace units at runtime with the toolchain it ships,
  # so it needs a real Node rather than a bundled snapshot.
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "vibestudio", shell_output("#{bin}/vibestudio --help")
  end
end
`);
