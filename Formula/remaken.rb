class Remaken < Formula
  desc "useful tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/macOS-Mojave%2Fremaken-1.6.2/remaken", :using => :curl
      sha256 "a8884e2833135a01d4effa894aad8a2b7d310f02c9fc68082b047dc213ce6068"
      depends_on "pkg-config" => :recommended
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/Ubuntu1804%2Fremaken-1.6.2/remaken", :using => :curl
      sha256 "d279de99be83d5b45d21949e6bc9d9615ff0d22e03b800e70b3b0d8069482079"
    end
  
  depends_on "conan" => :recommended
  depends_on "cmake" => :recommended

  def install
    bin.install "remaken"
  end
end
