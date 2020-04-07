class Remaken < Formula
  desc "usefull tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/macOS-Mojave%2Fremaken-1.6.1/remaken", :using => :curl
      sha256 "c7ff6130d4b9e7efa270d505ff430709bdc1971ee012b92e61f5f40d2dcf01b7"
      depends_on "pkg-config" => :recommended
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/Ubuntu1804%2Fremaken-1.6.0/remaken", :using => :curl
      sha256 "feb08af3f89355d866467b65e44377bfe17bee87c34f8c90dacda52e47a87cad"
    end
  
  depends_on "conan" => :recommended

  def install
    bin.install "remaken"
  end
end
