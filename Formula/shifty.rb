class Shifty < Formula
  desc "Menu bar posture shifter for macOS"
  homepage "https://github.com/human37/shifty"
  url "https://github.com/human37/shifty/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "6568bcf0b3ccb052c26d25df813bf0f762a60dcecb0736fffd6c996f9ebca23a"
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
