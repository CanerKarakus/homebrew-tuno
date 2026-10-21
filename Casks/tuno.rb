cask "tuno" do
  version "1.6.0"
  sha256 "dfaf0c91dbb01ec1d0cd97a4a181b131baefa4b5f4afc1eca1b4bdcdfa241246"

  url "https://gettuno.info/updates/Tuno-#{version}.dmg"
  name "Tuno"
  desc "Per-app volume, equalizer, window switcher and other missing system controls"
  homepage "https://gettuno.info/"

  livecheck do
    url "https://gettuno.info/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Tuno.app"

  uninstall quit: "app.tuno.mac"

  zap trash: [
    "~/Library/Application Support/Tuno",
    "~/Library/Caches/app.tuno.mac",
    "~/Library/HTTPStorages/app.tuno.mac",
    "~/Library/Preferences/app.tuno.mac.plist",
  ]
end
