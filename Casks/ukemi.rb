cask "ukemi" do
  version "0.17.0"
  sha256 "82b46a7e15e819db1bd6898418b511f75b69fc515ba1ae3f14c037c6f2634ef4"

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
