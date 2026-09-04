class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.2.0/syq-macos-arm64", using: :nounzip
      sha256 "1492bd47c795a48a15f8eafbfbb0a2bac114582d5e5899da83d1569d24e6c74d"
    else
      url "https://github.com/greaber/syq/releases/download/v0.2.0/syq-macos-x86_64", using: :nounzip
      sha256 "802d50176dbe255a2477e2d463813f8b644effc397b6541a3bd1bc6e012fc3c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.2.0/syq-linux-aarch64", using: :nounzip
      sha256 "872f5c06fcc58f2b2298a72e9c61094d434295420461ba569fe478c42ddba31e"
    else
      url "https://github.com/greaber/syq/releases/download/v0.2.0/syq-linux-x86_64", using: :nounzip
      sha256 "09d1a90104aecb4d7d8a1f7ff79c485eb3d3f8d6798ffc00b743b2827841d51b"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
