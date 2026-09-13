class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.6.0/syq-macos-arm64", using: :nounzip
      sha256 "013b580716ceee3b5009e38d5f40de8b8d87e32ef452a0f413c7648e0936c763"
    else
      url "https://github.com/greaber/syq/releases/download/v0.6.0/syq-macos-x86_64", using: :nounzip
      sha256 "cdf446463169db30871915d08a6bc4935387ca51f1fe3e5dde732cbca0ad60e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.6.0/syq-linux-aarch64", using: :nounzip
      sha256 "be19372ece930b3455c71bbefc4fba1ad259fd084478899d8e8a02710c538c66"
    else
      url "https://github.com/greaber/syq/releases/download/v0.6.0/syq-linux-x86_64", using: :nounzip
      sha256 "4fc2f442d88f83d05bf61a0b4eead718b681678b7c7ad6a52696c16d3f479a24"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
