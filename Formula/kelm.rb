class Kelm < Formula
    desc "Helm-aware kubectl plugin to filter by release"
    homepage "https://github.com/viveksair/kelm"
    url "https://github.com/viveksair/kelm/archive/refs/tags/v0.1.0.zip"
    version "0.1.0"
    sha256 "7d73672bc1d3197c63a5a2d894b7ab3a8b0c12f9fc53a2be3de95174328ae979"
  
    def install
      bin.install "kubectl-kelm"
    end
  
    test do
      system "#{bin}/kubectl-kelm", "--help"
    end
  end