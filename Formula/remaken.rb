class Remaken < Formula
  desc "usefull tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/macOS-Mojave%2Fremaken-1.5.2/remaken", :using => :curl
      sha256 "9a4d0e28e8ef23411f1aaa1c5960f5b5986b516df3c84cacd7679b08f1ded513"
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/Ubuntu1804%2Fremaken-1.5.2/remaken", :using => :curl
    end

    resource "qmake" do
      url "https://github.com/b-com-software-basis/builddefs-qmake.git", :using => :git, :branch => "master"
    end
  
  depends_on "pkg-config" => :recommended
  depends_on "conan" => :recommended

  def install
    bin.install "remaken"
    resource("qmake").unpack(share/"remaken/qmake")
    system "echo", ENV['HOMEBREW_HOME']
    system "mkdir","-p", "$HOME/.remaken/rules"
    system "ln","-s", share/"remaken/qmake", "$HOME/.remaken/rules/"
  end
end
