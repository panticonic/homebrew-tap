class VibestudioServer < Formula
  desc "Headless Vibestudio server and CLI"
  homepage "https://vibestudio.app/"
  url "https://registry.npmjs.org/@panticonic/vibestudio-server/-/vibestudio-server-0.1.55.tgz"
  sha256 "1da8553ad167587e58c5694b3e37240c5020bf1e88d350c343cf80f59a3cb258"
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
