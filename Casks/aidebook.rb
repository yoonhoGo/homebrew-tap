cask "aidebook" do
  version "0.1.0"
  sha256 "8156aa7613e73649de7c2acb2580a4affc917ace76f96ff80e56f59a5f1a2097"

  url "https://github.com/yoonhoGo/aidebook/releases/download/v#{version}/Aidebook_#{version}_aarch64.dmg"
  name "Aidebook"
  desc "Local context and workflow for an AI work assistant"
  homepage "https://github.com/yoonhoGo/aidebook"

  depends_on arch: :arm64
  depends_on :macos

  app "Aidebook.app"
  binary "#{appdir}/Aidebook.app/Contents/MacOS/aidebook-cli", target: "aidebook"
  binary "#{appdir}/Aidebook.app/Contents/MacOS/aidebook-cli"
  binary "#{appdir}/Aidebook.app/Contents/MacOS/aidebook-core"
end
