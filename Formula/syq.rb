class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.4.1/syq-macos-arm64", using: :nounzip
      sha256 "97d4e8eead3fc405a9eba036039fd7c84acdb85b273f88951b7a19f6f7b43bc9"
    else
      url "https://github.com/greaber/syq/releases/download/v0.4.1/syq-macos-x86_64", using: :nounzip
      sha256 "34895e8f8ce4b1dc615b9522d47b38e61c8bfbfd69d76a4c942c4936f303b1df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.4.1/syq-linux-aarch64", using: :nounzip
      sha256 "f4fffb21b4f677f9be79052e416da438f2ed935cfca738bec20e82a43d6e5696"
    else
      url "https://github.com/greaber/syq/releases/download/v0.4.1/syq-linux-x86_64", using: :nounzip
      sha256 "1bee23760b7c0428207ca29cc0fbf38f3c75427ce0da5c8fb02e90d42a71d59a"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
