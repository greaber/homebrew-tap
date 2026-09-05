class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.3.1/syq-macos-arm64", using: :nounzip
      sha256 "c50f4560c3b5e403e23d9c884cda7c40b05686f3bac3f1184cba520d05c6e19b"
    else
      url "https://github.com/greaber/syq/releases/download/v0.3.1/syq-macos-x86_64", using: :nounzip
      sha256 "ae554faeafca70757797657051ea41e7683f6204962af5636ced76bae2c5e998"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.3.1/syq-linux-aarch64", using: :nounzip
      sha256 "8254cb7bfb216ce84a3a3514869878bf8cadce62760ebc91273579a3de0e8173"
    else
      url "https://github.com/greaber/syq/releases/download/v0.3.1/syq-linux-x86_64", using: :nounzip
      sha256 "211739bb05f75049bcfeeba5f3499039dc2eca498be26d88125996215934cfef"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
