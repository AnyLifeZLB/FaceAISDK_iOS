# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'FaceAISDK_iOS' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # 1.  pod install --repo-update 安装依赖
  # 2.  ToastUI 使用SPM 管理 File->Add Package Dependence https://github.com/quanshousio/ToastUI.git

  pod 'FaceAISDK_Core', '0.0.70'
     


end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'FaceAISDK_Core'
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '5.9.2' # 改为你的主项目版本
      end
    end
  end
end
