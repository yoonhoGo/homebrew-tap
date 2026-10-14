cask "aidebook" do
  version "0.2.3"
  sha256 "5de467856a13e4711f4ce6eaedc687f6573a6af9261da8861132f24c5f0e91d5"

  url "https://github.com/yoonhoGo/homebrew-tap/releases/download/aidebook-v#{version}/Aidebook_#{version}_aarch64.dmg"
  name "Aidebook"
  desc "Local context and workflow for an AI work assistant"
  homepage "https://aidebook.yoonho.site/"

  livecheck do
    url "https://github.com/yoonhoGo/homebrew-tap.git"
    regex(/^aidebook-v(\d+(?:\.\d+)+)$/i)
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Aidebook.app"
  binary "#{appdir}/Aidebook.app/Contents/MacOS/aidebook-cli", target: "aidebook"
  binary "#{appdir}/Aidebook.app/Contents/MacOS/aidebook-cli"
  binary "#{appdir}/Aidebook.app/Contents/MacOS/aidebook-core"

  # Remove the download quarantine attribute from this app bundle only.
  # The release remains ad-hoc signed and is not notarized.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Aidebook.app"],
        must_succeed: false
  end
end
