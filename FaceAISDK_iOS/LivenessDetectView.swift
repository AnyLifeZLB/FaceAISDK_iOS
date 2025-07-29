import SwiftUI
import AVFoundation
import FaceAISDK_Core
import ToastUI


/**
 * 动作活体检测，（iOS 目前仅支持动作活体，静默 炫彩等排期）
 * UI 样式仅供参考，根据你的业务可自行调整
 */
struct LivenessDetectView: View {
    //确保ViewModel的生命周期与视图一致，使用@StateObject持有ViewModel，视图被销毁时会一起释放
    @StateObject private var viewModel: VerifyFaceModel = VerifyFaceModel()
    @State private var showToast = false
    @Environment(\.dismiss) private var dismiss
    
    //录入保存的FaceID 值。一般是你的业务体系中个人的唯一编码，比如账号 身份证
    let faceID: String
 
    let onDismiss: (FaceVerifyResult) -> Void
    
    var body: some View {
        VStack {
            Text(viewModel.verifyFaceTips)
                .font(.system(size: 19).bold())
                .padding(.bottom, 5)
                .foregroundColor(.black)
            
            Text(viewModel.verifyFaceTipsExtra)
                .font(.system(size: 17).bold())
                .padding(.bottom, 6)
                .frame(minHeight: 30)
                .foregroundColor(.black)
            
            FaceAICameraView(session: viewModel.captureSession,cameraSize: cameraSize)
                .frame(
                    width: min(UIScreen.main.bounds.width,cameraSize),
                    height: min(UIScreen.main.bounds.width,cameraSize))
                .aspectRatio(1.0, contentMode: .fit)   //Enforce1:1ratio
                .clipShape(Circle())     //Clip to ensure square bounds
            
            Spacer()
        }
        
        .onAppear {
            //初始化人脸引擎
            //是否仅仅需要动作活体检测，动作活体目前是随机的两个步骤
            viewModel.initFaceAISDK(faceIDParam: faceID,onlyLiveness: true)
        }
        
        .onChange(of: viewModel.faceVerifyResult.code) { newValue in
            showToast = true
            print("ViewModel 返回 ： \(viewModel.faceVerifyResult)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                showToast = false
                onDismiss(viewModel.faceVerifyResult)  // 传值给父视图
                dismiss() // 关闭页面
            }
        }
        
        .toast(isPresented: $showToast) {
            ToastView("\(viewModel.faceVerifyResult.tips)").toastViewStyle(.success)
        }
        
        .onDisappear{
            viewModel.stopFaceVerify() //停止
        }
        .padding()
        .background(Color.white)
    }
}

