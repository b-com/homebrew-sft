class Remaken < Formula
  desc "useful tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.6.4/remaken-macOS-Mojave", :using => :curl
      sha256 "f55b5f44ac8490fd56279c03fc5afe291eaad008aaffd99ac46825561ee301b1"
      depends_on "pkg-config" => :recommended
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.6.4/remaken-Ubuntu1804", :using => :curl
      sha256 "a1a2f94e0e6db93801a3367df4b7b4c3f997ceac5086fa5926441398a9eb33d6"
    end
  
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
