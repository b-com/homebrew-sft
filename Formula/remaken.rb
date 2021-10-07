class Remaken < Formula
  desc "useful tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.8.0/remaken-macOS-Mojave", :using => :curl
      sha256 "febd0df7de285fb8fddedd17d30e4e499b0168dcda57bce1d17cee22a87337a4"
      depends_on "pkg-config" => :recommended
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.8.0/remaken-Ubuntu1804", :using => :curl
      sha256 "49acc24019cbd70701a20831f07da6999e4a936abc501d2c70d15ac3dca13e8b"
      
    end

  version "1.8.0"

  depends_on "conan" => :recommended
  depends_on "cmake" => :recommended

  def install
    if OS.mac?
      bin.install "remaken-macOS-Mojave"
      mv bin/"remaken-macOS-Mojave", bin/"remaken"
    elsif OS.linux?
      bin.install "remaken-Ubuntu1804"
      mv bin/"remaken-Ubuntu1804", bin/"remaken"
    end
    system "conan", "remote", "add", "--force", "--insert", "0", "conancenter", "https://center.conan.io"
    system "conan", "remote", "add", "--force", "bincrafters", "https://bincrafters.jfrog.io/artifactory/api/conan/public-conan"
  end
end
