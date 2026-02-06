class Shifty < Formula
  desc "Menu bar posture shifter for macOS"
  homepage "https://github.com/human37/shifty"
  url "https://github.com/human37/shifty/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "456f162f18c61c8ae61a972f1308ddc53d044a6ba6132a15ee7d3982d9d2d51a"
  head "https://github.com/human37/shifty.git", branch: "main"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/shifty"
  end

  service do
    run [opt_bin/"shifty"]
    keep_alive true
    run_at_load true
    log_path var/"log/shifty.log"
    error_log_path var/"log/shifty.err.log"
  end
end
