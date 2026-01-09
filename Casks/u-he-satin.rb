require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'u-he-satin' do
  version '1.3.3,15721'
  sha256 '324e2f68168aed4341bd333fade54a23888d621e7406039c55d7596fa7f2a8b3'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("https://dl.u-he.com/releases/Satin_133_15721_Mac.zip")
  name 'u-he Satin'
  homepage 'https://u-he.com/products/satin/'

  pkg "Satin_#{version.after_comma}_Mac/Satin #{version.before_comma} Installer.pkg"

  uninstall pkgutil: 'com.u-he.Satin.*'

  zap delete: [
                '~/Library/Application Support/u-he/com.u-he.Satin.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Satin.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Satin.plist',
                '/Library/Application Support/u-he/Satin',
              ]
end
