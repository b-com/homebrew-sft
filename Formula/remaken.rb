class Remaken < Formula
  desc "useful tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.7.2/remaken-macOS-Mojave", :using => :curl
      sha256 "8cc8013095a026be3774c4b4778fbc7f184d5e4459126a41768933bb66461876"
      depends_on "pkg-config" => :recommended
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.7.2/remaken-Ubuntu1804", :using => :curl
      sha256 "f929d63c73a9ac9ead4fc3d6ebbcd53c0f958437693ea2ef964be5c102c25676"
      
    end

  version "1.7.2"

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
