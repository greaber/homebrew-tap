class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.syq.christmas/v0.8.0/syq-macos-arm64", using: :nounzip
      sha256 "8d484c4daa57376f458daeb69d3705638b53bd170359eefdac99eea2fc0332b8"
    else
      url "https://dl.syq.christmas/v0.8.0/syq-macos-x86_64", using: :nounzip
      sha256 "f3b113be7c71620bbaa4f947c1afab5697523ce8c18ad9d05864ccd1fc1ee815"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.syq.christmas/v0.8.0/syq-linux-aarch64", using: :nounzip
      sha256 "1f1cc4dad36bdc3dacfffa8b02d2ecc9cd1dd2546d31f30ff7917aa04fddd573"
    else
      url "https://dl.syq.christmas/v0.8.0/syq-linux-x86_64", using: :nounzip
      sha256 "023c21898559e8cdb8adfd0f6d6fe1187df4154294988b5323f460fff4b7fafa"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
