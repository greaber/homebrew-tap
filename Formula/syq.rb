class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.3.0/syq-macos-arm64", using: :nounzip
      sha256 "54f9bdd476be475575e39b238cd8683f6a8b107f44ab3b0616e730e96f830845"
    else
      url "https://github.com/greaber/syq/releases/download/v0.3.0/syq-macos-x86_64", using: :nounzip
      sha256 "b02eca5dd230a3671dd8701afa353ce32f4f314bb5b464045565b8e4d0f5ee33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.3.0/syq-linux-aarch64", using: :nounzip
      sha256 "9efa468bb9afbb109c899a90d44ed0e4df45de98308c549e70bb6d0eb0ebbcf6"
    else
      url "https://github.com/greaber/syq/releases/download/v0.3.0/syq-linux-x86_64", using: :nounzip
      sha256 "6ffc0e55ce1c4873271a8da32e27283a767e0b009ca139330cd48c6099a23d4a"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
