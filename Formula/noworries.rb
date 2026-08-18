class Noworries < Formula
  desc "Ephemeral infra harness that lets an AI verify the changes it just made"
  homepage "https://github.com/guvense/noworries"
  version "1.0.0"
  license "MIT"

  BASE = "https://github.com/guvense/noworries/releases/download/v#{version}".freeze

  on_macos do
    on_arm do
      url "#{BASE}/noworries-aarch64-apple-darwin.tar.gz"
      sha256 "743d8d776777c072f8d2913a4d57d6388a75e7acfbceed399c7caab7a6194255"
    end
    on_intel do
      url "#{BASE}/noworries-x86_64-apple-darwin.tar.gz"
      sha256 "faba895ad6ba063de9a75a83e39915a2447eed706922b131e9f91fe0884f113b"
    end
  end

  on_linux do
    on_intel do
      url "#{BASE}/noworries-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68e471bab456231a46837ab98e833c57cc6deb65d7546064a931b072c5d4feef"
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
