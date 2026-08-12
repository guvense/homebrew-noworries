class Noworries < Formula
  desc "Ephemeral infra harness that lets an AI verify the changes it just made"
  homepage "https://github.com/guvense/noworries"
  version "0.2.1"
  license "MIT"

  BASE = "https://github.com/guvense/noworries/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/noworries-aarch64-apple-darwin.tar.gz"
      sha256 "ca27478a6d31aaac340c63c9146c87b8fec20893166dd2a0976622cf14939495"
    end
    on_intel do
      url "#{BASE}/noworries-x86_64-apple-darwin.tar.gz"
      sha256 "ffeb209080d11210a257e923391e03b9268d18dc01eecb9154e607c45f653791"
    end
  end

  on_linux do
    on_intel do
      url "#{BASE}/noworries-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "301adb25579fa6c998c3e22d80a766e64682c3ab5bd5ed2839dff69ff6055eb8"
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
