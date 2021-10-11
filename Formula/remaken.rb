class Remaken < Formula
  desc "useful tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.8.1/remaken-macOS-Mojave", :using => :curl
      sha256 "53a51c94a4818d76ca2bfce08c22deecc2c4cf8192794178a66995d16acf08b7"
      depends_on "pkg-config" => :recommended
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.8.1/remaken-Ubuntu1804", :using => :curl
      sha256 "381832f6ed5b4665a24ddf569474279f3ebf3d94808b86267db28026af2c1e54"
      
    end

  version "1.8.1"

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
