class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.syq.christmas/v0.7.0/syq-macos-arm64", using: :nounzip
      sha256 "89ff98d3d23b3a219be79342eca29bdc910587b5e73bdf44b3ad2c4470a150e9"
    else
      url "https://dl.syq.christmas/v0.7.0/syq-macos-x86_64", using: :nounzip
      sha256 "8b4051f5582bead2e1141f9d06076ae1d48a515d113350253a14a16253c1d2ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.syq.christmas/v0.7.0/syq-linux-aarch64", using: :nounzip
      sha256 "a629a28aa68623c242ca7b87bc185d933c5bd2f953e22c4172b3469f27032116"
    else
      url "https://dl.syq.christmas/v0.7.0/syq-linux-x86_64", using: :nounzip
      sha256 "5d4f6a18eb8a5cf61f7067480515485b462379a16a2872dac935fb48b59fa556"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
