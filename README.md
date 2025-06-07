## FaceAISDK 介绍
iOS FaceAISDK is on_device Offline Face Detection 、Recognition 、Liveness Detection Anti Spoofing SDK
FaceAISDK是iOS 设备端可离线不需联网的人脸识别、动作活体检测、人脸录入SDK，快速集成后实现相关功能。


## 集成步骤
SDK 默认的开发环境为Xcode 16+,语言为OC，C，Swift 6.1（重构完后会降级）；UI为SwiftUI实现

- 1. Podfile 添加  pod 'FaceAISDK', ' version'
  2. 
（请指定版本号，确保科学上网能同步GitHub）
  首次依赖安装Installing TensorFlowLiteSwift 会耗费10分钟左右时间（实际取决于你的网络状态）
  更新到新版本SDK pod install --repo-update
  
- 2. 拷贝FaceAINaviView,AddFaceView,VerifyFaceView 到你的工程  
  记得声明相机使用权限；应用内跳转到 FaceAINaviView功能演示导航页面你就可以开始体验效果  
  
- 3. 根据你的业务需求修改View 和参数设置等定制你的应用  
  SDK中人脸录入和识别都需要指定一个唯一的FaceID Key来关联你的用户，可以使用注册的手机号，身份证等  
  动作活体检测可以指定动作活体的步骤个数为1还是2个；其中SDK 的UI实现是完整暴露给开发者自由修改    

## 其他说明 
  本SDK 需要摄像头实时获取预览数据，目前只支持真机调试。
  
  微信：HaoNan19990322  
  Email: FaceAISDK.Service@gmail.com   

## 其他平台？

  uniApp: https://github.com/AnyLifeZLB/UniPlugin-FaceAISDK  
  Android：https://github.com/AnyLifeZLB/FaceVerificationSDK   
  
  Android体验Demo APK下载如下  

<div align=center>
<img src="https://user-images.githubusercontent.com/15169396/210045090-60c073df-ddbd-4747-8e24-f0dce1eccb58.png" width = 22% height = 22% />
</div>

![FaceAISDKDemo](https://github.com/user-attachments/assets/bddef598-999d-451e-ac29-1a0fbc2533bd)
