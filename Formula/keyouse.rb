# Homebrew formula — builds from source, so no code signing/notarization is needed
# (swift build ad-hoc signs the binary; a locally built binary isn't quarantined by Gatekeeper).
#
# Publish this in a tap repo (e.g. github.com/yoonhoGo/homebrew-tap as Formula/keyouse.rb),
# then: brew install yoonhoGo/tap/keyouse
#
# Requires the keyouse repo (or its release tarball) to be PUBLIC.
class Keyouse < Formula
  desc "Keyboard-driven macOS UI navigator (accessibility-based, like Shortcat)"
  homepage "https://github.com/yoonhoGo/keyouse"
  url "https://github.com/yoonhoGo/keyouse/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a9c1ee65a2c46e2248824455effe579848d5e66d4ca1e81d831d34eea3afd493"
  license "MIT"

  depends_on :macos
  # No `depends_on xcode` — `swift build` works with the Command Line Tools alone.

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/keyouse"
  end

  def caveats
    <<~EOS
      keyouse needs Accessibility permission:
        System Settings > Privacy & Security > Accessibility  (add your terminal or keyouse)
      Optionally Input Monitoring for ⌘Tab window switching.

      Run `keyouse` to start; it runs as a menu-bar app and detaches from the terminal.

      "Start at login" installs a LaunchAgent. After uninstalling, remove it with:
        rm -f ~/Library/LaunchAgents/com.keyouse.loginitem.plist
    EOS
  end
end
