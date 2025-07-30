#!/bin/sh

# 1. 清理并构建真机框架 (iOS device)
xcodebuild clean archive \
  -scheme FaceAISDK_Core \
  -configuration Release \
  -destination "generic/platform=iOS" \
  -archivePath "build/FaceAISDK_Core-iOS.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# 2. 清理并构建模拟器框架 (iOS Simulator)
xcodebuild clean archive \
  -scheme FaceAISDK_Core \
  -configuration Release \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "build/FaceAISDK_Core-Simulator.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# 3. 创建 XCFramework（包含分发支持）
xcodebuild -create-xcframework \
  -framework "build/FaceAISDK_Core-iOS.xcarchive/Products/Library/Frameworks/FaceAISDK_Core.framework" \
  -framework "build/FaceAISDK_Core-Simulator.xcarchive/Products/Library/Frameworks/FaceAISDK_Core.framework" \
  -output "build/FaceAISDK_Core.xcframework"
