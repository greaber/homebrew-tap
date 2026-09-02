class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.8/syq-macos-arm64", using: :nounzip
      sha256 "b5356db4ec84b64e6af0fd6ecdb0073b3efcd605398d77627376208ed281ecb2"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.8/syq-macos-x86_64", using: :nounzip
      sha256 "6f164effd5d9a955ad35b66aae7afe4e8433fde0f1d4850df0893eb57b095d86"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.8/syq-linux-aarch64", using: :nounzip
      sha256 "a5cfb37b5b340021ff5154db6f7313e35785302eb8cbfc31836cf37295ea704d"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.8/syq-linux-x86_64", using: :nounzip
      sha256 "019329523e03ff7492679059af37a83244dad18715fabcc684c253fac4f8d661"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
