cask "ukemi" do
  version "0.14.0"
  sha256 "b2eeb1630569c75b4bc667be8480bf57360f68437e9da35784a182fc4179cba9"

  # The source repository is private. The public tap mirrors this release DMG
  # under the same filename so Homebrew does not need GitHub credentials.
  url "https://github.com/yoonhoGo/homebrew-tap/releases/download/ukemi-v#{version}/Ukemi_#{version}_aarch64.dmg"
  name "Ukemi"
  desc "Desktop GUI for Jujutsu"
  homepage "https://github.com/yoonhoGo/ukemi"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Ukemi.app"

  # The release is ad-hoc signed and not notarised. Remove only the quarantine
  # attribute that Homebrew propagates from the public DMG.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Ukemi.app"],
        must_succeed: false
  end
end
