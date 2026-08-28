class Syq < Formula
  desc "Parallel copy with an rsync-shaped interface"
  homepage "https://github.com/greaber/syq"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.3/syq-macos-arm64", using: :nounzip
      sha256 "0e786b0407e2189e4d1fe41a87926ae3ce84e352c6254c9a275d25b3d1a67f3c"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.3/syq-macos-x86_64", using: :nounzip
      sha256 "7f82e9606550e12e5f96d5a5e1bca691b3f6d1919c910855fef4404f9845b030"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/greaber/syq/releases/download/v0.1.3/syq-linux-aarch64", using: :nounzip
      sha256 "43f70d8bbf97b60b147b832a6f2c8b28f56969d98ac740f6ed8861ba0995111f"
    else
      url "https://github.com/greaber/syq/releases/download/v0.1.3/syq-linux-x86_64", using: :nounzip
      sha256 "0e3217a26935775c371e6ead226670e06e426d5b41453c90e50be1b0f6088a78"
    end
  end

  def install
    bin.install Dir["syq-*"].first => "syq"
  end

  test do
    assert_match "syq #{version}", shell_output("#{bin}/syq --version")
  end
end
