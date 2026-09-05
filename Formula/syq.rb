class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.3.2/syq-macos-arm64", using: :nounzip
      sha256 "2533ac1e728fe22fb98d429addbbb75eab5294c8dc9fe141e320cd30ccf04962"
    else
      url "https://github.com/greaber/syq/releases/download/v0.3.2/syq-macos-x86_64", using: :nounzip
      sha256 "b3aaa720a0a97fdaddd61439e0b77afbcf29f3f4662324880ff1d4a86e3d69ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.3.2/syq-linux-aarch64", using: :nounzip
      sha256 "0e8df569683cd36d2c7e05184fcca5165eff91834599eba81e183af059a5ef4a"
    else
      url "https://github.com/greaber/syq/releases/download/v0.3.2/syq-linux-x86_64", using: :nounzip
      sha256 "406e36b0e2cd69b68af6230bf7ef9726b309cdff62160e46b6818b02efdc4042"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
