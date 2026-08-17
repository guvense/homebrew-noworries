class Noworries < Formula
  desc "Ephemeral infra harness that lets an AI verify the changes it just made"
  homepage "https://github.com/guvense/noworries"
  version "0.15.0"
  license "MIT"

  BASE = "https://github.com/guvense/noworries/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/noworries-aarch64-apple-darwin.tar.gz"
      sha256 "d61455c8507ededf763d1db6f85cb9ddda0d4607cbfd235c834d4d137322c21c"
    end
    on_intel do
      url "#{BASE}/noworries-x86_64-apple-darwin.tar.gz"
      sha256 "5a31fa9e0e6871b558dccf57155972cd23ba9354b7a72522ced26e238def6d2a"
    end
  end

  on_linux do
    on_intel do
      url "#{BASE}/noworries-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aea58958c4f2677fbba6f3b39e477856e144f38c3a7ba832bbfc543f7993299a"
    end
  end

  def install
    bin.install "noworries"
  end

  def caveats
    <<~EOS
      Install the /noworries slash command for Claude Code (once):
        noworries install-command

      noworries needs Docker running when you use it.
    EOS
  end

  test do
    assert_match "noworries", shell_output("#{bin}/noworries --version")
  end
end
