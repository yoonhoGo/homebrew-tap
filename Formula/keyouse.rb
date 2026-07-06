# Homebrew formula — installs a prebuilt binary (no build, no Xcode/CLT needed).
# The binary is ad-hoc signed by `swift build`; Homebrew formula downloads aren't quarantined,
# so Gatekeeper allows it on Apple Silicon without Developer ID signing/notarization.
#
# Publish in a tap (github.com/yoonhoGo/homebrew-tap as Formula/keyouse.rb):
#   brew install yoonhoGo/tap/keyouse
#
# CI (release.yml) builds a universal binary on tag push and bumps url/sha256 here.
class Keyouse < Formula
  desc "Keyboard-driven macOS UI navigator (accessibility-based, like Shortcat)"
  homepage "https://github.com/yoonhoGo/keyouse"
  url "https://github.com/yoonhoGo/keyouse/releases/download/v0.2.0/keyouse-macos.tar.gz"
  version "0.2.0"
  sha256 "8c265b36feb1ca59617f462157007c7651c1591c408b668772cf07a476c2ce6b"
  license "MIT"

  depends_on :macos

  def install
    bin.install "keyouse"
  end

  def caveats
    <<~EOS
      keyouse needs Accessibility permission:
        System Settings > Privacy & Security > Accessibility  (add keyouse)
      Optionally Input Monitoring for ⌘Tab window switching.

      Run `keyouse` to start; it runs as a menu-bar app and detaches from the terminal.

      "Start at login" installs a LaunchAgent. After uninstalling, remove it with:
        rm -f ~/Library/LaunchAgents/com.keyouse.loginitem.plist
    EOS
  end
end
