#
# Be sure to run `pod lib lint CircularProgressView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CircularProgressBarView'
  s.version          = '1.0.2'
  s.summary          = 'CircularProgressBarView.'
  s.description      = 'CircularProgressBarView.'
  s.homepage         = 'https://github.com/joongseod/CircularProgressView'
  s.screenshots     = 'https://user-images.githubusercontent.com/21167746/144393441-21d8fd56-717d-424f-a1bc-79e6870886db.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'joongseod' => 'ehdwndtj@naver.com' }
  s.source           = { :git => 'https://github.com/joongseod/CircularProgressView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'CircularProgressView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CircularProgressView' => ['CircularProgressView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
