# Uncomment the next line to define a global platform for your project
platform :ios, '12.1'

target 'AcaBase' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AcaBase

	pod 'Alamofire', '~> 5.1'
	pod 'MessageKit'
	pod 'MessageInputBar'
	pod 'Firebase/Core'
	pod 'Firebase/Auth'
	pod 'Firebase/Storage'
	pod 'Firebase/Firestore'
	pod 'Firebase/Database'
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          if target.name == 'MessageKit'
              target.build_configurations.each do |config|
                  config.build_settings['SWIFT_VERSION'] = '4.2'
              end
          end
      end
  end

  target 'AcaBaseTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'AcaBaseUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
