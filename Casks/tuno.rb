cask "tuno" do
  version "2.1.0"
  sha256 "de8d3ad52c3ae1d9e0fd556bd513f27ff6d9db3c476f6f89a14f07180e4edbe1"

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
