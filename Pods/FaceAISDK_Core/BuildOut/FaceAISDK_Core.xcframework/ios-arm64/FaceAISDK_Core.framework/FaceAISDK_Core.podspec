Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '16.0'
s.name = "FaceAISDK_Core"

s.summary = "FaceAISDK 不用联网单机实现人脸录入，人脸识别和活体检验；FaceAI SDK can add face, face recognition, and liveness detection on_device offline"

# CD 到Product 目录然后命令 xcodebuild -create-xcframework -framework Release-iphoneos/FaceAISDK_Core.framework -output FaceAISDK_Core.xcframework

# git tag version
# git push origin version
# 上传 pod trunk push FaceAISDK_Core.podspec --skip-import-validation
# 更新 pod install --repo-update


s.version = "2025.07.28"
s.swift_version = "6.1"

s.static_framework = true

# 3
s.license = { :type => "FaceAISDK License", :file => "LICENSE" }
s.author = { "FaceAISDK_Core" => "FaceAISDK.Service@gmail.com" }
s.homepage = "https://github.com/AnyLifeZLB/FaceAISDK_Core"
s.source = { :git => "https://github.com/AnyLifeZLB/FaceAISDK_Core.git",
             :tag => "#{s.version}" }

s.dependency 'GoogleMLKit/FaceDetection','9.0.0'
s.dependency 'TensorFlowLiteSwift','2.17.0'

s.pod_target_xcconfig = {'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

s.user_target_xcconfig = {'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }


s.ios.vendored_frameworks  = 'BuildOut/*.xcframework'
s.resources = ['Resources/subModel.bundle','Model.bundle']

end

