class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.1/syq-macos-arm64", using: :nounzip
      sha256 "a0e72b1d1d04d10930c862ec3d6d225f61606bf388f93c996feb6289b36773e0"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.1/syq-macos-x86_64", using: :nounzip
      sha256 "d85d44e05f71f53c36736e4118a4c19721d4ff8e693ddad94a6938b201f464d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.1/syq-linux-aarch64", using: :nounzip
      sha256 "1457b4d9402b7634c85f61d7aef80447bd0a6efc3332334c47be18bd3ea8673a"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.1/syq-linux-x86_64", using: :nounzip
      sha256 "760db46ab5cac86177c72f2f87b4ec9b255945eb33c67ceea5d1b1eb05d9e90d"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
