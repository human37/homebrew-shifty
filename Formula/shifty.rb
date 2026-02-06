class Shifty < Formula
  desc "Menu bar posture shifter for macOS"
  homepage "https://github.com/human37/shifty"
  url "https://github.com/human37/shifty/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "5e6b84e9c5525df04cb5a63c0f24a62566fa9971e9b9499f10565916d205fbf5"
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
