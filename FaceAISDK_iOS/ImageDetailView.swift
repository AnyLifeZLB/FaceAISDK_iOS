import SwiftUI

//
//  ImageDetailView.swift
//  SDKDev
//
//  Created by anylife on 5/30/25.
//
struct ImageDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var uiImage: UIImage?

    let faceID: String
    let onDismiss: (String) -> Void
    
    var body: some View {
        VStack {
            //加一点人脸合规的提示🔔
            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding(100)
                    .background(Color.gray.opacity(0.1))
            }
            Button("知道了") {
                dismiss() 
            }
            .padding()
        }
        .onAppear(){
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentDirectory.appendingPathComponent(faceID)
            
            guard FileManager.default.fileExists(atPath: fileURL.path) else {
                print("文件不存在: \(faceID)")
                return
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                if let imageData = try? Data(contentsOf: fileURL),
                   let loadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.uiImage = loadedImage
                    }
                } else {
                    print("图片加载失败: \(faceID)")
                }
            }
        }
    }
    
    
}
