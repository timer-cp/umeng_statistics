#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint umeng_statistics.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'umeng_statistics'
  s.version          = '0.0.1'
  s.summary          = 'The plugin of Umeng statistics.'
  s.description      = <<-DESC
The plugin of Umeng statistics.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'UMCommon'
  s.dependency 'UMDevice'
#  s.dependency 'UMAPM'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
