class Pympress < Formula
  include Language::Python::Virtualenv

  desc "Simple and powerful dual-screen PDF reader designed for presentations"
  homepage "https://github.com/Cimbali/pympress/"
  url "https://files.pythonhosted.org/packages/8c/1f/6d081d546bd57fd2b6537bd6dcb204a96f5490150b0f1ed8e152fe0e484a/pympress-1.8.1.tar.gz"
  sha256 "448c6abc9c74373311be5fff5e09d5dc32e7a18459290180eb34f3373d9ba4ce"
  license "GPL-2.0-or-later"
  head "https://github.com/Cimbali/pympress.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "45c35f890a12c1366a133639c4be40a42f08f02c3b0c956f2d7a283a5e17924c"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "5ae156875483217aeea9285f11a975702a8276197c064d084e4cf504817cf965"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "57bf56a75c88bbf323a8cdd16db71ce3e26603194e5e145fd30fe32ce3187fb8"
    sha256 cellar: :any_skip_relocation, ventura:        "760c0305decb192528f49066db8c4b5b7db84be3c45efe99937cf15f57bd69de"
    sha256 cellar: :any_skip_relocation, monterey:       "87d54f922fe9afc8414222f617b8e7413bd9a7392c75eb9a3b26c59c96e27517"
    sha256 cellar: :any_skip_relocation, big_sur:        "327a1eb24da466102393c001e19bc212992f31f62c48ca361ab8baac80abf81e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b0a4f91cc1243171dc3260fc8e0b55e544eb2823d3343e066d134bb233c8a0d0"
  end

  depends_on "gobject-introspection"
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-base"
  depends_on "gst-plugins-good"
  depends_on "gst-plugins-ugly"
  depends_on "gstreamer"
  depends_on "gtk+3"
  depends_on "libyaml"
  depends_on "poppler"
  depends_on "pygobject3"
  depends_on "python@3.11"

  resource "watchdog" do
    url "https://files.pythonhosted.org/packages/95/a6/d6ef450393dac5734c63c40a131f66808d2e6f59f6165ab38c98fbe4e6ec/watchdog-3.0.0.tar.gz"
    sha256 "4d98a320595da7a7c5a18fc48cb633c2e73cda78f93cac2ef42d42bf609a33f9"
  end

  def install
    virtualenv_install_with_resources
    bin.install_symlink libexec/"bin/pympress"
  end

  test do
    # (pympress:48790): Gtk-WARNING **: 13:03:37.080: cannot open display
    return if OS.linux? && ENV["HOMEBREW_GITHUB_ACTIONS"]

    system bin/"pympress", "--quit"
  end
end
