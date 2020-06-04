class Remaken < Formula
  desc "useful tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/macOS-Mojave%2Fremaken-1.6.3/remaken", :using => :curl
      sha256 "9acb64a1f6c0cef0e43af722c9ea2b5966450e44566ef88a37b40efce474a773"
      depends_on "pkg-config" => :recommended
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/Ubuntu1804%2Fremaken-1.6.3/remaken", :using => :curl
      sha256 "1966692a5adc438eac714529b7f5340492ec6ee2f046febcc3a62b28f0dc4bbe"
    end
  
  depends_on "conan" => :recommended
  depends_on "cmake" => :recommended

  def install
    bin.install "remaken"
  end
end
