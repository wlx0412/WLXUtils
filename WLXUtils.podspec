#
# Be sure to run `pod lib lint WLXUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WLXUtils'
  s.version          = '0.1.0'
  s.summary          = 'A short description of WLXUtils.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wlx0412/WLXUtils'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wlx0412' => '164305171@qq.com' }
  s.source           = { :git => 'https://github.com/wlx0412/WLXUtils.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_versions = ['5.0', '5.1', '5.2']
  s.source_files = 'WLXUtils/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WLXUtils' => ['WLXUtils/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
#   s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 4.0'
  s.dependency 'SDWebImage'
  s.dependency 'SDWebImageFLPlugin'
  s.dependency 'FLAnimatedImage'
  s.dependency 'SnapKit'
  s.dependency 'IGListKit'
  s.dependency 'SwiftyFitsize'
  s.dependency 'HandyJSON'
  s.dependency 'Alamofire'
  s.dependency 'MJRefresh'
  s.dependency 'EmptyPage'
  s.dependency 'AttributedString'
  s.dependency 'SwiftDate'
  s.dependency 'IQKeyboardManager'
  s.dependency 'MBProgressHUD'
  s.dependency 'ZZCircleProgress' #环形进度条
  s.dependency 'SJVideoPlayer' #视频播放器
  s.dependency 'SJBaseVideoPlayer'
  s.dependency 'JXSegmentedView'
  s.dependency 'ActiveLabel' #可点击的lab
  s.dependency 'AAInfographics'
  s.dependency 'TZImagePickerController'
  s.dependency 'YBImageBrowser' #图片浏览器
  s.dependency 'YBImageBrowser/Video' #视频功能需添加
  s.dependency 'YYImage'
  s.dependency 'SwiftyJSON'
  s.dependency 'ZCycleView'
end
