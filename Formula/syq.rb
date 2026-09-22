class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.syq.christmas/v0.7.1/syq-macos-arm64", using: :nounzip
      sha256 "1b3619bc8ba79fed4de465f7411e97c3e4133807a39845d763d122c51eefe9e7"
    else
      url "https://dl.syq.christmas/v0.7.1/syq-macos-x86_64", using: :nounzip
      sha256 "03fd8827122b5956d6bf00d47efb99df630925d3521f42cf9a525ea0c0465392"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.syq.christmas/v0.7.1/syq-linux-aarch64", using: :nounzip
      sha256 "16fc2b1a194902e30ebf8ef3923ee9506dd95846ededf502dd4112c3327152ae"
    else
      url "https://dl.syq.christmas/v0.7.1/syq-linux-x86_64", using: :nounzip
      sha256 "879cb7b24e321568f3de691c8af90f9648cac44c30d24dc2d1b33c40a509bbf6"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
