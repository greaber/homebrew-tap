class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.2/syq-macos-arm64", using: :nounzip
      sha256 "0ae0e7eaa1685d289949b91fee956082242781f5e00ead2fd8ea455d1ea5b49f"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.2/syq-macos-x86_64", using: :nounzip
      sha256 "da8993b25002738da1e52152fe966ae9f2748296c600f8043a3b312e1679c238"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.2/syq-linux-aarch64", using: :nounzip
      sha256 "81c2029087c45b95fe8506e1b1691e7e31daab37c103a22cd4bdbbf8ff4984b8"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.2/syq-linux-x86_64", using: :nounzip
      sha256 "977e925640cb234224f32faddf8ac94d622220a8c1a705e0066942c87c125588"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
