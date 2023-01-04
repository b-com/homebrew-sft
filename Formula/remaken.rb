class Remaken < Formula
  desc "Useful tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.9.2/remaken-macOS-Mojave", :using => :curl
      sha256 "156cd733fa70b57f4ffc74fa034bfa16632e471b0fc9a41eca4a2409b2cf47f1"
      depends_on "pkg-config" => :recommended
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.9.4/remaken-Ubuntu1804", :using => :curl
      sha256 "c15cbc1e0b5a0c34b2a03aa6c4a5e0310598e05589b6a84cd63fbcda9e8b55b2"
      
    end

  version "1.9.4"

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
