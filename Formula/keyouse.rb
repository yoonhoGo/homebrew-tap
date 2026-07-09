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
  url "https://github.com/yoonhoGo/keyouse/releases/download/v0.4.0/keyouse-macos.tar.gz"
  version "0.4.0"
  sha256 "ef14af76a1cb87ce950ba65440ee2c6f96c7a8e8b5065fb4b7069f89bd57d9aa"
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
