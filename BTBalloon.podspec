#
# Be sure to run `pod lib lint BTBalloon.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BTBalloon"
  s.version          = "0.1.0"
  s.summary          = "BTBalloon is a custom UIView subclass that will display text and optionally an image and/or button in a balloon style popup."
  s.homepage         = "https://github.com/brightec/BTBalloon"
  s.license          = 'Apache License, Version 2.0'
  s.author           = { "Cameron Cooke" => "cameron@brightec.co.uk" }
  s.source           = { :git => "https://github.com/brightec/BTBalloon.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/brightec'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'BTBalloon' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'PureLayout', '~> 2.0.6'
end
