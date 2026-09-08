class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.5.1/syq-macos-arm64", using: :nounzip
      sha256 "82c6531cb3c734043753584f653661c71d856d37a06c6398128713126e64e52f"
    else
      url "https://github.com/greaber/syq/releases/download/v0.5.1/syq-macos-x86_64", using: :nounzip
      sha256 "1d8b5ef4f854b338159156df42d3689f7bd3357cbd0ab83f667b009748dd70d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.5.1/syq-linux-aarch64", using: :nounzip
      sha256 "4138370398f4d03c2bc98b3f358dc15303dc72dd9cd11a90e82e6d72e17e1239"
    else
      url "https://github.com/greaber/syq/releases/download/v0.5.1/syq-linux-x86_64", using: :nounzip
      sha256 "8f7e2b3cbc1bb88d2f58b426872639157f894ae917ace1ef24a630cda5ad071c"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
