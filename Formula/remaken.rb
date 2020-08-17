class Remaken < Formula
  desc "useful tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.7.1/remaken-macOS-Mojave", :using => :curl
      sha256 "e7b79e824b5bb9ecaec9caac533405df0ff86095161a0100176e7f984cc4766a"
      depends_on "pkg-config" => :recommended
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.7.1/remaken-Ubuntu1804", :using => :curl
      sha256 "9032c144a5f72a0594c815d515ae283afc1d6f136d36986fa747e25cf50579cb"
      
    end

  version "1.7.1"

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
    system "conan", "remote", "add", "--force", "--insert", "0", "conan-community", "https://api.bintray.com/conan/conan-community/conan"
    system "conan", "remote", "add", "--force", "bincrafters", "https://api.bintray.com/conan/bincrafters/public-conan"
  end
end
