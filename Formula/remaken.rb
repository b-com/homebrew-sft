class Remaken < Formula
  desc "usefull tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/macOS-Mojave%2Fremaken-1.5.2/remaken", :using => :curl
      sha256 "9a4d0e28e8ef23411f1aaa1c5960f5b5986b516df3c84cacd7679b08f1ded513"
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/Ubuntu1804%2Fremaken-1.5.2/remaken", :using => :curl
      sha256 "debd38ebf4670bc73da066f789f3509ddb67d692456eca851aa6e1a106e70e14"
    end
  
  depends_on "pkg-config" => :recommended
  depends_on "conan" => :recommended

  def install
    bin.install "remaken"
  end
end
