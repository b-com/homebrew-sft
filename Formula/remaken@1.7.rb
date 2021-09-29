class RemakenAT1.7 < Formula
  desc "useful tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.7.3/remaken-macOS-Mojave", :using => :curl
      sha256 "34cc7b2d5526901df514586be58ace7553dd708e0166b6929ffc0cf30e604be0"
      depends_on "pkg-config" => :recommended
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.7.3/remaken-Ubuntu1804", :using => :curl
      sha256 "6f7bff2557a1d7255b56972ef27f6ace3356f8f29204d0c0f284328bb25872eb"
    end

  version "1.7.3"

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
