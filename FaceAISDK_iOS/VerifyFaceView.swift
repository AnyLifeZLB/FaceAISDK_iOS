import SwiftUI
import AVFoundation
import FaceAISDK_Core
import ToastUI


/**
 * 人脸识别，摄像头采集画面需要真机调试
 * UI 样式仅供参考，根据你的业务可自行调整
 */
struct VerifyFaceView: View {
    //确保ViewModel的生命周期与视图一致，使用@StateObject持有ViewModel，视图被销毁时会一起释放
    @StateObject private var viewModel: VerifyFaceModel = VerifyFaceModel()
    @State private var showToast = false
    @Environment(\.dismiss) private var dismiss
    
    //录入保存的FaceID 值。一般是你的业务体系中个人的唯一编码，比如账号 身份证
    let faceID: String
    //人脸相似度阈值，范围0.8到0.95.
    //设置的相似度阈值越高，对人脸角度，环境光线和摄像头宽动态要求越高
    let threshold:Float
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
            //初始化人脸引擎,设置人脸识别的底片和比对相似度阈值（0.8到0.95）
            //设置的相似度阈值越高，对人脸角度，环境光线和摄像头宽动态要求越高
            //动作活体目前是随机的两个步骤，当前不支持设置，6月底会开发更多设置
            viewModel.initFaceAISDK(faceIDParam: faceID,threshold: threshold)
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
            let sim = String(format: "%.2f", viewModel.faceVerifyResult.similarity)
            if(viewModel.faceVerifyResult.similarity>threshold){
                ToastView("\(viewModel.faceVerifyResult.tips)  \(sim)").toastViewStyle(.success)
            }else {
                ToastView("\(viewModel.faceVerifyResult.tips)  \(sim)").toastViewStyle(.failure)
            }

        }
        
        .onDisappear{
            viewModel.stopFaceVerify() //停止
        }
        .padding()
        .background(Color.white)
    }
}

