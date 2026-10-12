cask "aidebook" do
  version "0.2.0"
  sha256 "2710b5e74ca466f01619c1f19f02f6b69b4f1f7c1227f5185cb5d931f258f537"

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
