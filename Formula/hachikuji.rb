# Homebrew formula for the tap glpecile/homebrew-tap (file: Formula/hachikuji.rb).
# tools/release.sh fills in the version, URLs and checksums.
class Hachikuji < Formula
  desc "IDE-style completion popup for zsh that uses almost no memory"
  homepage "https://github.com/glpecile/hachikuji"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/glpecile/hachikuji/releases/download/v1.0.0/hachikuji-1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "e6a82be9e79de11e4f6e011615b87cb05d32091746dfcd3fc84e939ba5744923"
    end
    on_intel do
      url "https://github.com/glpecile/hachikuji/releases/download/v1.0.0/hachikuji-1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "4801dda01fad36afb8059a3239317b902ed20e2c1edd64bbd9cbe715b0f66893"
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
    EOS
  end

  test do
    assert_match "source", shell_output("#{bin}/hachikuji init zsh")
    assert_match "count=", shell_output("#{bin}/hachikuji complete 'git chec'")
  end
end
