import SwiftUI
import AVFoundation
import FaceAISDK_Core


let cameraSize: CGFloat = 300 //  相机的尺寸


/**
 *  人脸录入，摄像头采集画面需要真机调试
 *  UI 样式仅供参考，根据你的业务可自行调整
 *
 */
public struct AddFaceView: View {
    //录入保存的FaceID 值。一般是你的业务体系中个人的唯一编码，比如账号 身份证
    let faceID: String
    let onDismiss: (String?) -> Void
        
    @StateObject private var viewModel: AddFaceModel = AddFaceModel()
    
    public var body: some View {
        VStack {
            Text(viewModel.addFaceTips)
                .font(.system(size: 19).bold())
                .padding(.bottom, 5)
                .foregroundColor(.black)
            
            Text(viewModel.addFaceTipsExtra)
                .font(.system(size: 17).bold())
                .padding(.bottom, 6)
                .frame(minHeight: 30)
                .foregroundColor(.black)
            
            FaceAICameraView(session: viewModel.captureSession,cameraSize: cameraSize)
                .frame(
                    width: min(UIScreen.main.bounds.width,cameraSize),
                    height: min(UIScreen.main.bounds.width,cameraSize))
                .aspectRatio(1.0, contentMode: .fit) //Enforce1:1ratio
                .clipShape(Circle()) // Clip to ensure square bounds
                .background(Color.white)
            
            Spacer()
        }
        
        .overlay {
            if viewModel.readyConfirmFace {
                // 弹窗让用户确认录入的人脸是否合规
                PopupConfirmView(
                    viewModel:viewModel,
                    onConfirm: {
                        //保存人脸图和命名
                        let facePath=viewModel.confirmSaveFaceAir(fileName: faceID)

                        onDismiss(facePath)
                    }
                )
            }
        }
        .animation(.easeInOut, value: true)
        .onAppear {
            viewModel.initAddFace()
        }
        .onDisappear{
            viewModel.stopAddFace()
        }
        .padding()
        .background(Color.white)
    }
    
    
    struct PopupConfirmView: View {
        let viewModel: AddFaceModel
        let onConfirm: () -> Void
        
        var body: some View {
            VStack(alignment: .center) {
                Text("人脸录入确认")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                
                Text("请录入清晰无遮挡正脸图")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .font(.system(size: 14).bold())
                
                Image(uiImage:viewModel.canAddFace)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
                    .cornerRadius(9)
                
                HStack(spacing: 30) {
                    Button("重试") {
                        viewModel.reInit()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    
                    Button("确认") {
                        onConfirm()  //触发关闭弹窗和页面的操作
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }.padding()
                
            }
            .frame(maxWidth: .infinity, minHeight: 250)
            .background(Color.white)
            .cornerRadius(9)
            .shadow(radius: 9)
        }
    }
    
}



/**
 * IDE 编辑预览
 */
//#Preview {
//    AddFaceView(faceID: <#String#>, onDismiss: <#(String) -> Void#>)
//}
