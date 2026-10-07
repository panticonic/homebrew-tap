class VibestudioServer < Formula
  desc "Headless Vibestudio server and CLI"
  homepage "https://vibestudio.app/"
  url "https://registry.npmjs.org/@panticonic/vibestudio-server/-/vibestudio-server-0.1.74.tgz"
  sha256 "3e361d2a45f8a413cc6520f07a10254c304719921af8258917e61cad6bde3d97"
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
