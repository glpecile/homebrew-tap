# Homebrew formula for the tap glpecile/homebrew-tap (file: Formula/hachikuji.rb).
# tools/release.sh fills in the version, URLs and checksums.
class Hachikuji < Formula
  desc "IDE-style completions for zsh and nushell that use almost no memory"
  homepage "https://github.com/glpecile/hachikuji"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/glpecile/hachikuji/releases/download/v1.1.0/hachikuji-1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "1b3705ce5eed7e17e84c1d60b17b76bdf89d344341b1db05b81fa91c6075c384"
    end
    on_intel do
      url "https://github.com/glpecile/hachikuji/releases/download/v1.1.0/hachikuji-1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "6d8e7d844e07cb46969872ad8407772d3a0748aa5b4d83625abd5d78467835f8"
    end
  end

  def install
    bin.install "bin/hachikuji"
    pkgshare.install Dir["share/hachikuji/*"]
  end

  def caveats
    <<~EOS
      Run `hachikuji init zsh` and add the line it prints to ~/.zshrc,
      before zsh-syntax-highlighting (which must load last).

      In nushell, save the config in an autoload folder:
        hachikuji init nu | save -f ($nu.user-autoload-dirs | first | path join hachikuji.nu)
    EOS
  end

  test do
    assert_match "source", shell_output("#{bin}/hachikuji init zsh")
    assert_match "count=", shell_output("#{bin}/hachikuji complete 'git chec'")
    assert_match "completer", shell_output("#{bin}/hachikuji init nu")
    assert_match "checkout", shell_output("#{bin}/hachikuji complete --nu '[\"git\",\"chec\"]'")
  end
end
