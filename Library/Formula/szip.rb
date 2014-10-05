require 'formula'

class Szip < Formula
  homepage 'http://www.hdfgroup.org/HDF5/release/obtain5.html#extlibs'
  url 'http://www.hdfgroup.org/ftp/lib-external/szip/2.1/src/szip-2.1.tar.gz'
  sha1 'd241c9acc26426a831765d660b683b853b83c131'

  option :universal

  def install
    ENV.append "CXXFLAGS", "-stdlib=libstdc++"
    ENV.append "CFLAGS", "-stdlib=libstdc++"
    ENV.append "LDFLAGS", "-stdlib=libstdc++ -lstdc++"
    ENV["CXX"] = "/usr/bin/clang++ -stdlib=libstdc++"
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
