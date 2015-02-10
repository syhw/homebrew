require "formula"

class Xa < Formula
  homepage "http://www.floodgap.com/retrotech/xa/"
  url "http://www.floodgap.com/retrotech/xa/dists/xa-2.3.7.tar.gz"
  sha1 "e5a6eb86c5683c217a778553a78a30780702c1d9"

  bottle do
    cellar :any
    sha1 "967f429a4c744559d20632b832c663ca6cc213a7" => :yosemite
    sha1 "b5c58e6cc5e6da4d3f1e09c5491b9246aaf4e01c" => :mavericks
    sha1 "833f31b264abacbb1ee72ff263a861af408c102b" => :mountain_lion
  end

  def install
    system "make", "CC=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "DESTDIR=#{prefix}",
                   "install"
  end

  test do
    (testpath/"foo.a").write "jsr $ffd2\n"

    system "#{bin}/xa", "foo.a"
    code = File.open("a.o65", "rb") { |f| f.read.unpack("C*") }
    assert_equal [0x20, 0xd2, 0xff], code
  end
end
