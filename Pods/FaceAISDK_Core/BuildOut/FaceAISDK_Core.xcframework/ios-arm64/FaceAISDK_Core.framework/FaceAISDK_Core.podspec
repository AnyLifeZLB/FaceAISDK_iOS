Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '16.0'
s.name = "FaceAISDK_Core"

s.summary = "FaceAISDK 不用联网单机实现人脸录入，人脸识别和活体检验；FaceAI SDK can add face, face recognition, and liveness detection on_device offline"

# git tag version
# git push origin version
# 上传 pod trunk push FaceAISDK_Core.podspec --skip-import-validation
# 更新 pod install --repo-update

s.version = "1.0.0.alpha2"
s.swift_version = "6.1"


# 3
s.license = { :type => "FaceAISDK License", :file => "LICENSE" }
s.author = { "FaceAISDK_Core" => "FaceAISDK.Service@gmail.com" }
s.homepage = "https://github.com/FaceAISDK/FaceAISDK_Core"
s.source = { :git => "https://github.com/FaceAISDK/FaceAISDK_Core.git",
             :tag => "#{s.version}" }

s.dependency 'GoogleMLKit/FaceDetection','9.0.0'
s.dependency 'TensorFlowLiteSwift','2.17.0'


# 添加 BUILD_LIBRARY_FOR_DISTRIBUTION 支持
s.pod_target_xcconfig = {
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
    'OTHER_SWIFT_FLAGS' => '-Xfrontend -enable-library-evolution',
    'SKIP_INSTALL' => 'NO',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
}
  
# 静态框架设置（如果需要）
s.static_framework = true
s.user_target_xcconfig = {
  'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
  'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
}


s.ios.vendored_frameworks  = 'BuildOut/*.xcframework'
s.resources = ['Resources/subModel.bundle','Model.bundle']

end

