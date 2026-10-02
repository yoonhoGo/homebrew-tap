cask "aidebook" do
  version "0.1.5"
  sha256 "7bc7371e29cf054ecc7b0cd7058df2c6425a4dbdcc60f480323998139c9b5360"

  url "https://github.com/yoonhoGo/homebrew-tap/releases/download/aidebook-v#{version}/Aidebook_#{version}_aarch64.dmg"
  name "Aidebook"
  desc "Local context and workflow for an AI work assistant"
  homepage "https://aidebook.yoonho.site/"

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
