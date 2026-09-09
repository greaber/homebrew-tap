class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.5.2/syq-macos-arm64", using: :nounzip
      sha256 "be189643f64579ef55a5bf73ad1a593916e464208401523a767c0192201eb1ba"
    else
      url "https://github.com/greaber/syq/releases/download/v0.5.2/syq-macos-x86_64", using: :nounzip
      sha256 "0d3191e1e3499725d21f10350d6384f3366c1deb68c67213d3f945503afe4a49"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.5.2/syq-linux-aarch64", using: :nounzip
      sha256 "c38bb81cb2542834ea26feec30c814938206c1cfaa8df7ddf970581c05ae33e7"
    else
      url "https://github.com/greaber/syq/releases/download/v0.5.2/syq-linux-x86_64", using: :nounzip
      sha256 "5e4586bdc9706834cc907ff087afed57180e918e7459f9cefb7fda4e7973dbff"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
