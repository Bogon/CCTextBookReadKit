#
# Be sure to run `pod lib lint CCTextBookReadKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CCTextBookReadKit'
  s.version          = '1.1.0'
  s.summary          = 'CCTextBookReadKit 是一个解析text文本的小说解析器，其目的是主要是解析Text或者是网络文本。本版本最低支持iOS 10.0'
  s.swift_version = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
CCTextBookReadKit 是一个解析text文本的小说解析器，其目的是主要是解析Text或者是网络文本。
还需要在该Kit中添加网络解析部分，并将网络部分提取出来，正确提供出更加定制化的功能和API。
                       DESC

  s.homepage         = 'https://github.com/Bogon/CCTextBookReadKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Bogon' => 'zhangqixcu@gmail.com' }
  s.source           = { :git => 'https://github.com/Bogon/CCTextBookReadKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CCTextBookReadKit/Classes/**/*'
  
  s.resource_bundles = {
      'CCTextBookReadKit' => ['CCTextBookReadKit/Classes/CCTextBookReadKit.bundle']
 }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'CCBRKCoverController', '~> 0.1.0'
  s.dependency 'CCBRKSegmentedControl', '~> 0.1.0'
  s.dependency 'CCBRKValuePopUpView', '~> 0.1.0'
  s.dependency 'CCProgressHUDKit', '~> 1.1.1'
  s.dependency 'CCBRKMagnifierView', '~> 0.1.0'
  s.dependency 'FDFullscreenPopGesture', '~> 1.1'
  
end
