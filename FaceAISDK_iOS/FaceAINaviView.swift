// ContentView.swift
import SwiftUI
import FaceAISDK_Core
import ToastUI


/**
 * iOS  FaceAISDK 功能导航页面
 */
struct FaceAINaviView: View {
    @State private var navigationPath = NavigationPath()
    @State private var addFaceResult: String?
    @State private var faceVerifyResult: FaceVerifyResult?
    
    //录入保存的FaceID 值。一般是你的业务体系中个人的唯一编码，比如账号 身份证
    private let faceID="yourFaceIDValue";
    
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(spacing: 20) {
                
                Button("添加人脸照片") {
                    navigationPath.append(FaceAINaviDestination.AddFacePageView(faceID))
                }.padding(.top,55)
                
                Text("变动路径：\(addFaceResult ?? " 暂无")")
                                    .font(.system(size: 9).bold())
                                    .padding(.horizontal,7)
                
                
                Button("人脸识别活体检测") {
                    navigationPath.append(FaceAINaviDestination.VerifyFacePageView(faceID))
                }.padding(.top,20)
                
                
                Button("动作活体检测") {
                    navigationPath.append(FaceAINaviDestination.LivenessView(faceID))
                }.padding(.top,25)
                
                
                Button("判断本地人脸照片是否存在") {
                    print("是否存在：\(FaceImageManger.isFaceImageExist(faceID: faceID))")
                }.padding(.top,33).font(.system(size: 11).bold())

                
                Button("本地人脸照片转Base64") {
                    print("转化结果？：\(FaceImageManger.imageFromDocumentsToBase64(fileName: faceID))")
                    
                }.padding(.top,11).font(.system(size: 11).bold())

                Button("同步Base64图片到本地") {
                    print("同步Base64图片到本地：\(FaceImageManger.saveBase64ImageToLocal(base64String: base64Data, fileName: faceID))")
                }.padding(.top,11).font(.system(size: 11).bold())


                Spacer()
                
                Button("关于我们"){
                    // 记得切换成iOS 的介绍版本
                    let url = URL(string: "https://mp.weixin.qq.com/s/R43s70guLqxA6JPEdWtjcA")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        if UIApplication.shared.canOpenURL(url!) {
                            UIApplication.shared.open(url!)
                        }
                    }
                }
                
            }
            
            .navigationTitle("FaceAISDK 🧭")
            .navigationDestination(for: FaceAINaviDestination.self) { destination in
                switch destination {
                    
                case .AddFacePageView(let param):
                    AddFaceView(faceID: param,onDismiss: { result in
                        addFaceResult = result
                        navigationPath.removeLast()
                    })
                    
                case .VerifyFacePageView(let param):
                    //设置的相似度阈值threshold越高，对人脸角度，环境光线和摄像头宽动态要求越高
                    VerifyFaceView(faceID: param,threshold: 0.85, onDismiss: { result in
                        faceVerifyResult = result
                        
                        // faceVerifyResult.code
                        // -2  人脸识别动作活体检测超过10秒
                        // -1  多次切换人脸或检查失败
                        // 0   默认值
                        // 1   人脸识别对比成功大于设置的threshold
                        // 2   人脸识别对比识别小于设置的threshold
                        
                        print("verifyFaceView 返回 ：\(faceVerifyResult?.tips) \(faceVerifyResult?.code)")
                        
                        if !navigationPath.isEmpty { // 检查路径是否为空
                            navigationPath.removeLast()
                        }
                    })
                case .LivenessView(let param):
                    
                    // faceVerifyResult.code
                    // -2  人脸识别动作活体检测超过10秒
                    // -1  多次切换人脸或检查失败
                    // 0   默认值
                    // 3   动作活体检测成功
                    
                    LivenessDetectView(faceID: param,onDismiss: { result in
                        print("活体检测返回 ：\(result.tips) \(result.code)")
                        navigationPath.removeLast()
                    })
                    
                }
            }
        }
    }
    
    
}


enum FaceAINaviDestination: Hashable {
    case AddFacePageView(String)
    case VerifyFacePageView(String)
    case LivenessView(String)
}

#Preview {
    FaceAINaviView()
}


// 仅仅开放给VIP 用户
private let base64Data="data:image/jpeg;base64,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"
