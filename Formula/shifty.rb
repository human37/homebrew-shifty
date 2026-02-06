class Shifty < Formula
  desc "Menu bar posture shifter for macOS"
  homepage "https://github.com/human37/shifty"
  url "https://github.com/human37/shifty/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "691d514144274e3deb38501ca6f846a368b0e9dfebffb659cf9d83795d362d3a"
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
