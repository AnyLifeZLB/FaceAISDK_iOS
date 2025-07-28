<img src="https://badgen.net/badge/FaceAI%20SDK/%20%E5%BF%AB%E9%80%9F%E5%AE%9E%E7%8E%B0%E4%BA%BA%E8%84%B8%E8%AF%86%E5%88%AB%E5%8A%9F%E8%83%BD" />
<br>


<div align=center>
<img src="https://github.com/user-attachments/assets/b1e0a9c4-8b43-4eb8-bf7a-7632901cfb2c" width = 20% />
</div>


## FaceAISDK 介绍
iOS FaceAISDK is on_device Offline Face Detection 、Recognition 、Liveness Detection Anti Spoofing SDK.  
FaceAISDK是iOS 设备端可离线不需联网的人脸识别、动作活体检测、人脸录入SDK，集成后可快速实现相关功能。  


.  
<div align=center>
<img src="https://github.com/user-attachments/assets/b52b8ddf-b4e1-4f43-b2e4-dd77e0156082" width = 70% height = 70% />
</div>  
.  



## 集成步骤

SDK默认的开发环境为Xcode 16.3 ,实现语言为Swift 6.1，OC&C；UI全部使用SwiftUI实现

#### 0. 安装Demo运行的ToastUI 依赖库
Navigate to your project settings. Find a new tab called “Package Dependencies”. 
Click the “+” button to open the add package dialog. 
Installation ToastUI https://github.com/quanshousio/ToastUI 

![添加ToastUI](https://www.quanshousio.com/ToastUI/images/com.quanshousio.ToastUI/xcode-add-package@1x.png)  


#### 1.Podfile 添加依赖
  最新版本一般会在本工程Podfile 中指定，请复制指定版本到你的项目
  首次依赖 安装SDK及内部依赖 会耗费10分钟左右时间（实际取决于你的网络状态）  
  pod update FaceAISDK_Core 安装依赖,请指定版本。

  pod 'FaceAISDK_Core', 'Newest Version'  


#### 2. 拷贝FaceAINaviView,AddFaceView,VerifyFaceView 到你的工程  
  记得声明相机使用权限；应用内跳转到 FaceAINaviView功能演示导航页面你就可以开始体验效果  
  
#### 3. 根据你的业务需求修改View 和参数设置等定制你的应用  
  SDK中人脸录入和识别都需要指定一个唯一的FaceID Key来关联你的用户，可以使用注册的手机号，身份证等  
  动作活体检测可以指定动作活体的步骤个数为1还是2个；其中SDK 的UI实现是完整暴露给开发者自由修改  
  
#### 怎么清除缓存？
- 1. pod cache clean --all
- 2. pod deintegrate 

## 其他说明 
  本SDK 需要摄像头实时获取预览数据，目前只支持真机调试。
  
  微信：FaceAISDK  
  Email: FaceAISDK.Service@gmail.com   

## 其他平台？
  uniApp接入正重构为UTS 插件，0810 等待UNI官方协调上线处理.   
  uniApp:  https://github.com/AnyLifeZLB/uniPlugin_FaceAI_UTS    
  Android：https://github.com/AnyLifeZLB/FaceVerificationSDK     
  
  Android体验Demo APK下载如下  
  
<div align=center>
<img src="https://user-images.githubusercontent.com/15169396/210045090-60c073df-ddbd-4747-8e24-f0dce1eccb58.png" width = 22% />
</div>  

.  



