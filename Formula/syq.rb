class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.4.0/syq-macos-arm64", using: :nounzip
      sha256 "8c7479a45280a4a2d80b59fd9cabcb25cdfa48850acb879b7ad64d49c3933d0c"
    else
      url "https://github.com/greaber/syq/releases/download/v0.4.0/syq-macos-x86_64", using: :nounzip
      sha256 "f0733e29986f4cca302fdc5c1098f3b64440baf33402c5a45acfcbbc11202fff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.4.0/syq-linux-aarch64", using: :nounzip
      sha256 "ff6af9235c59e52978718801b27638de9253a831744f7dd60c753d5487c9f94b"
    else
      url "https://github.com/greaber/syq/releases/download/v0.4.0/syq-linux-x86_64", using: :nounzip
      sha256 "47b532c60423b047fd858de448f54067edd4e72019582d40dffa43c5cc73c9fc"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
