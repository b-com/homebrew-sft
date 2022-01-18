class Remaken < Formula
  desc "Useful tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.9.1/remaken-macOS-Mojave", :using => :curl
      sha256 "46ae060ef117ac2e23e08e0706da9b0c4fa5ebef8f13ba8098325c2f2ce1954c"
      depends_on "pkg-config" => :recommended
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.9.1/remaken-Ubuntu1804", :using => :curl
      sha256 "baf6abd0b1ea3d7e94bacb4bedd810a1e58ab5fee5771fe085ed35d1572231b4"
      
    end

  version "1.9.1"

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
