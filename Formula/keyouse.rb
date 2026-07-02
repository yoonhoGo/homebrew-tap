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
  url "https://github.com/yoonhoGo/keyouse/releases/download/v0.1.1/keyouse-macos.tar.gz"
  sha256 "1dafc73b6b2f93a16e6869613b43ffaff397229862d186bd801bed759ce63dd4"
  version "0.1.1"
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
