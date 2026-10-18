cask "tuno" do
  version "1.4.5"
  sha256 "7f2585805e394b98340b41286ad28256b6a779e5c8f68599b99e22ec3c297727"

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
