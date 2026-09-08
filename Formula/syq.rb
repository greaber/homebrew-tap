class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.5.0/syq-macos-arm64", using: :nounzip
      sha256 "9269ded6237ca2968effbd612fd7770dd4fb688fb28e8a23bab2c3362dfc87d0"
    else
      url "https://github.com/greaber/syq/releases/download/v0.5.0/syq-macos-x86_64", using: :nounzip
      sha256 "8dbfdc0d245237a1b050e0213a1cb162c155adc6519382c92abc4b3180f84804"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.5.0/syq-linux-aarch64", using: :nounzip
      sha256 "9f4c987c2e0b9fc8ee35dc984401ab5cb6cc49f364dd1074e98916babe8b8226"
    else
      url "https://github.com/greaber/syq/releases/download/v0.5.0/syq-linux-x86_64", using: :nounzip
      sha256 "2b01ae5f931edca736473244b12f2daecd763bb4505dde1c866ff2aba9b25f8f"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
