#
# Be sure to run `pod lib lint ABKeyboardAccessory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ABKeyboardAccessory'
  s.version          = '0.1.0'
  s.summary          = 'UIView subclass which can be used as an inputAccessory, with delegate methods for determining keyboard appearance and disappearance.'

  s.description      = <<-DESC
ABKeyboardAccessory makes it easier to determine when a keyboard is being shown/dismissed for UITextViews and UITextFields. ABKeyboardAccessory subclasses UIView, and is implemented by setting the ABKeyboardView as the 'inputAccessory' for the desired UITextView/UITextField. ABKeyboardAccesoryDelegate provides methods which relay information about the current frame of the ABKeyboardAccessory view, where one can adjust UI depending on the keyboard appearance.
                       DESC

  s.homepage         = 'https://github.com/andrewboryk/ABKeyboardAccessory'
  s.screenshots      = 'https://github.com/AndrewBoryk/ABKeyboardAccessory/blob/master/ABKeyboardAccessoryScreenshot.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andrewboryk' => 'andrewcboryk@gmail.com' }
  s.source           = { :git => 'https://github.com/andrewboryk/ABKeyboardAccessory.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/TrepIsLife'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ABKeyboardAccessory/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ABKeyboardAccessory' => ['ABKeyboardAccessory/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
