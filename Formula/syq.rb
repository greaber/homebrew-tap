class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.0/syq-macos-arm64", using: :nounzip
      sha256 "a7257f049c7d044bb0c7398c8973a3b0af7eae99e56fe9e250cf8bda35479a6a"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.0/syq-macos-x86_64", using: :nounzip
      sha256 "cf9cb47448cf56087d2c428bffe8cf8d6db31d5ae51bfd655a1dee4efd9df3e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.0/syq-linux-aarch64", using: :nounzip
      sha256 "7a3e45d64b27311d1d2afcef418761d4afc80fcc491908c9bcfbaf39431f90d0"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.0/syq-linux-x86_64", using: :nounzip
      sha256 "7a52111bc6395d9cb03115417acfdbbdf925277da4e2e53d308a433a2f01ed7d"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
