cask "aidebook" do
  version "0.1.1"
  sha256 "b17030f290404b2eb87379f6480497b27e1998f6c5ba258053dd713cb8aec472"

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
