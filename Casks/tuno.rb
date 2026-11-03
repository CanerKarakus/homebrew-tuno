cask "tuno" do
  version "2.1.1"
  sha256 "8dfb6070b6139f199c6438383432f8d588d5e3e7c0db8c8611fd66afecf2b9cd"

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
