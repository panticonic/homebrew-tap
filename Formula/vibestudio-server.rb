class VibestudioServer < Formula
  desc "Headless Vibestudio server and CLI"
  homepage "https://vibestudio.app/"
  url "https://registry.npmjs.org/@panticonic/vibestudio-server/-/vibestudio-server-0.1.83.tgz"
  sha256 "79f2220631b0a752740f990aedabe500cb911125b4b1f64d98d3b1330b570dc0"
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
