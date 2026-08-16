class Noworries < Formula
  desc "Ephemeral infra harness that lets an AI verify the changes it just made"
  homepage "https://github.com/guvense/noworries"
  version "0.11.0"
  license "MIT"

  BASE = "https://github.com/guvense/noworries/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/noworries-aarch64-apple-darwin.tar.gz"
      sha256 "686368de50894cf740a31a7158f2ec431418b107886fac502068c719d54d0cb2"
    end
    on_intel do
      url "#{BASE}/noworries-x86_64-apple-darwin.tar.gz"
      sha256 "e376e26d123e51c11860e2051f540d801e46fdd08f863774ddbb1dee7934c665"
    end
  end

  on_linux do
    on_intel do
      url "#{BASE}/noworries-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6cb4280e0161a0faa7d7abcaca9adb991edaab5dd12bc4bcf9cf50290b0a541b"
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
