Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '16.0'
s.name = "FaceAISDK_Core"

s.summary = "识别花花草草类型 测试验证"

#s.summary = "FaceAISDK 可以不用联网单机实现人脸录入，人脸识别和活体检验；Framework SDK for add face, face recognition, and liveness detection"

# 这是备份，没有用的
# pod trunk push FaceAISDK_Core.podspec --skip-import-validation
# pod install --repo-update
s.version = "0.0.2"


# 不支持模拟器 跳过检验


# 3
s.license = { :type => "FaceAISDK License", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "FaceAISDK_Core" => "FaceAISDK.Service@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/AnyLifeZLB/FaceAISDK_Core"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/AnyLifeZLB/FaceAISDK_Core.git",
             :tag => "#{s.version}" }

# 7
s.dependency 'GoogleMLKit/FaceDetection'
s.dependency 'TensorFlowLiteSwift'



# 忽略警告 http://gonghonglou.com/2021/03/09/xcode12-lint-error/
s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }



# 8

s.ios.vendored_frameworks   = 'BuildOut/*.framework'

# 资源文件目前是个头疼的问题

s.resources = ['Resources/subModel.bundle']

# 10
s.swift_version = "5.9.2"

end

