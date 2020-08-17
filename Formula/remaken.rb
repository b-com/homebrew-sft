class Remaken < Formula
  desc "useful tool that handles binary dependencies from various package managers (conan, vcpkg, system package managers) or from bare repositories with remaken own package format."
  homepage "https://github.com/b-com-software-basis/remaken"


    if OS.mac?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.7.0/remaken-macOS-Mojave", :using => :curl
      sha256 "96f24d99965291db3dacf6f00dfe4c22a438336dd0203526f0716ef749ed2e0a"
      depends_on "pkg-config" => :recommended
    elsif OS.linux?
      url "https://github.com/b-com-software-basis/remaken/releases/download/1.7.0/remaken-Ubuntu1804", :using => :curl
      sha256 "10b7e717ab74681ab96e5162374c8d57954cdcc7a6b51c6af69d4a3908c7cdf2"
      
    end

  version "1.7.0"

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
