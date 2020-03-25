class Remaken < Formula
  desc "usefull tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/macOS-Mojave%2Fremaken-1.5.2/remaken", :using => :curl
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/Ubuntu1804%2Fremaken-1.5.2/remaken", :using => :curl
    end

    resource "qmake" do
      url "https://github.com/b-com-software-basis/builddefs-qmake.git", :using => :git, :branch => :master
    end

  def install
    bin.install "remaken"
  end
end
