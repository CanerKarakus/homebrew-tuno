cask "tuno" do
  version "1.6.1"
  sha256 "0f35be594fcf679d404a0d1f402f440a241cc64d3e857fb4d91262a15c12fb87"

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
