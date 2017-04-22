class Adf < Formula
  desc "Arena Development Framework"
  homepage "https://github.com/kvuong2"
  url "http://artifactory.dev.bom.com/artifactory/uploaded-third-party-private-artifacts-local/com/bom/webops/adf/1.0.0/adf-1.0.0.gz"
  sha256 "070270129b33308f214dfe986732dbe71e74625fb600590e200318e152351ecc"

  def install
    old_home = ENV["HOME"]
    old_curl_home = ENV["CURL_HOME"]
    ENV["HOME"] = old_curl_home
    system "tar xf adf-1.0.0 -C $HOME"
    system "export"
    system "echo | $HOME/adf/bin/adf init"
    system "adf sync tool"
    ENV["HOME"] = old_home
    system "which adf"
  end

  def caveats
    "Open a new terminal window to activate the ADF environment variables."
  end

  test do
    system "which adf"
  end
end
