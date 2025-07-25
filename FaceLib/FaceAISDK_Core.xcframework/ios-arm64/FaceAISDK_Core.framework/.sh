#!/bin/sh
# 如果脚本放进Xcode的run script中运行，可以不设置这个PROJECT_NAME，
# 因为它同时也是 Xcode 项目的全局变量，用于获取项目名。
PROJECT_NAME=DemoFramework

# 我们framework的名字是和项目名一样的，如果不一样的的话，可以单独设置。
framework_name=$PROJECT_NAME

# 导出xcframework的路径
output_path=$HOME/${framework_name}_XCFramework

# 模拟器的存档位置
simulator_archive_path=$output_path/simulator.xcarchive
# 真机的存档位置
iOS_device_archive_path=$output_path/iOS.xcarchive

# 删除旧版，然后创建新版
rm -r $output_path
mkdir $output_path

# 打包模拟器
xcodebuild archive \
-scheme $framework_name \
-destination "generic/platform=iOS Simulator" \
-archivePath $simulator_archive_path \
SKIP_INSTALL=NO

# 打包真机
xcodebuild archive \
-scheme $framework_name \
-destination "generic/platform=iOS" \
-archivePath $iOS_device_archive_path \
SKIP_INSTALL=NO

# 创建 xcframework
xcodebuild -create-xcframework \
-framework $simulator_archive_path/Products/Library/Frameworks/$framework_name.framework \
-framework $iOS_device_archive_path/Products/Library/Frameworks/$framework_name.framework \
-output $output_path/$framework_name.xcframework

# 打包完成后，存档就失去作用，只作为中间打包过程使用。
rm -r $simulator_archive_path $iOS_device_archive_path

# 打开 XCFramework 所在的目录
open $output_path


