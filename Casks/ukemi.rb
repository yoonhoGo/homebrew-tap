cask "ukemi" do
  version "0.22.1"
  sha256 "596e58d71f757d48383f09fc6b98791d45ea2327cd001d84b9fad75d20cabc93"

  # The source repository is private. The public tap mirrors this release DMG
  # under the same filename so Homebrew does not need GitHub credentials.
  url "https://github.com/yoonhoGo/homebrew-tap/releases/download/ukemi-v#{version}/Ukemi_#{version}_aarch64.dmg"
  name "Ukemi"
  desc "Desktop GUI for Jujutsu"
  homepage "https://github.com/yoonhoGo/ukemi"

  depends_on arch: :arm64
  depends_on :macos

  app "Ukemi.app"

  # The release is ad-hoc signed and not notarised. Remove only the quarantine
  # attribute that Homebrew propagates from the public DMG.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Ukemi.app"],
        must_succeed: false
  end
end
