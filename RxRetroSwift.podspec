#
# Be sure to run `pod lib lint RxRetroSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxRetroSwift'
  s.version          = ENV["RXRETROFIT_VERSION"] || '3.0.0'
  s.summary          = 'A Simple, Neat and Clean, Easy to use Reactive RetroFit inspired implementation in swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    A Simple, Neat and Clean, Easy to use Reactive RetroFit inspired implementation in swift. 
    All you have to do is create models( and viewModels) and let the RxRetroSwift handle the difference response objects for you.
    
                       DESC

  s.homepage         = 'https://github.com/michaelhenry/RxRetroSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Henry Pantaleon' => 'me@iamkel.net' }
  s.source           = { :git => 'https://github.com/michaelhenry/RxRetroSwift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/michaelhenry119'
  s.ios.deployment_target = '10.0'
  s.source_files = 'Sources/RxRetroSwift/**/*'
  s.dependency 'RxSwift', '~> 5.0'
  s.dependency 'RxCocoa', '~> 5.0'
end
