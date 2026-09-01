class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.5/syq-macos-arm64", using: :nounzip
      sha256 "acd13c45729625d4ec994f4fbdf0c3b37d1e31ebca0d2e1639a9fa6f78b8aef7"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.5/syq-macos-x86_64", using: :nounzip
      sha256 "1b0c20ae5e213e726c13129c67a598393c2c63af7433b5fd44a2daae91401f2c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.5/syq-linux-aarch64", using: :nounzip
      sha256 "a8b6b0e7602d789668bdd433946144ffa67116f815ed1bf5bea8308f141d6b12"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.5/syq-linux-x86_64", using: :nounzip
      sha256 "eaf06c96e851ecd573313832607439a0c8033b6f5f6cca9c3c8b4b081556066d"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
