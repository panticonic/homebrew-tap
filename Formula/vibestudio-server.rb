class VibestudioServer < Formula
  desc "Headless Vibestudio server and CLI"
  homepage "https://vibestudio.app/"
  url "https://registry.npmjs.org/@panticonic/vibestudio-server/-/vibestudio-server-0.1.57.tgz"
  sha256 "f2ea96c96d517af2003a8f254c6e3585747c3dce988bccda003cd2ae7a39871f"
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
