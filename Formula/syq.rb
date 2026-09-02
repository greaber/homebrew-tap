class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.7/syq-macos-arm64", using: :nounzip
      sha256 "aed4e2876ff18f975a5de51a186c50c532116232b8459361a0ddef41ea0731d5"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.7/syq-macos-x86_64", using: :nounzip
      sha256 "162db3f421be4b4f9331cac09e337b704daf2a271d0ce159df8d4be102544732"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.7/syq-linux-aarch64", using: :nounzip
      sha256 "b542c0d3a59e0dba74b798c9e49f65ad51ae12a4e79e92cab20505ad74e9bdaf"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.7/syq-linux-x86_64", using: :nounzip
      sha256 "3b1b0f9265df01ddb2e75167ede7ba86b05d486654b57a65516e370b610d7038"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
