require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-opentok"
  s.version      = package["version"]
  s.summary      = "An OpenTok SDK for react-native"
  s.authors      = {
    'Harrie van der Lubbe' => 'harrie@calltheone.com'
  }

  s.homepage     = "https://www.calltheone.com"

  s.license      = "MIT"
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/mindd/react-native-opentok.git", "master"}

  s.source_files  = "*.{h,m}"
  s.dependency 'React'
  s.dependency "OpenTok"
end
