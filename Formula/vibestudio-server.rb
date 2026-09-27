class VibestudioServer < Formula
  desc "Headless Vibestudio server and CLI"
  homepage "https://vibestudio.app/"
  url "https://registry.npmjs.org/@panticonic/vibestudio-server/-/vibestudio-server-0.1.48.tgz"
  sha256 "b74733c765e47d0e990113cd016449e1d65465ad18264049674d960aa4a6e4b8"
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
