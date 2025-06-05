// ContentView.swift
import SwiftUI
import FaceAISDK_Core


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
                
                Button("去添加人脸照片") {
                    navigationPath.append(FaceAINaviDestination.AddFacePageView(faceID))
                }.padding(.top,66)
                
                Text("保存路径：\(addFaceResult ?? " 暂无")")
                    .font(.system(size: 10).bold())
                    .padding(22)
    
                
                
                Button("查看我的人脸底片") {
                    navigationPath.append(FaceAINaviDestination.ImageDetailView(faceID))
                }.padding(.top,44)
                
                
                Button("人脸识别，活体检测") {
                    navigationPath.append(FaceAINaviDestination.VerifyFacePageView(faceID))
                }.padding(.top,44)
                

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
            .navigationTitle("FaceAISDK Navi.🧭")
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
                        
                        
                        if !navigationPath.isEmpty { // 检查路径是否为空
                            navigationPath.removeLast()
                        }
                    })
                case .ImageDetailView(let param):
                    ImageDetailView(faceID: param,onDismiss: { result in
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
    case ImageDetailView(String)
}

#Preview {
    FaceAINaviView()
}
