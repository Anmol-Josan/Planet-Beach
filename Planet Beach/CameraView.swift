import SwiftUI
import UIKit

struct CameraView: UIViewControllerRepresentable {
    @Binding var isShown: Bool // Binding to control when the camera is presented/dismissed
    @Binding var image: UIImage? // Binding to store the captured image
    
    // Coordinator to handle the delegate callbacks
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CameraView // A reference to the parent CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        // Called when the user captures a photo
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage { // Retrieve the captured image
                            parent.image = uiImage // Assign it to the parent's binding
                        }
                        parent.isShown = false // Dismiss the camera
        }
        
        // Called when the user cancels the camera
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isShown = false // Dismiss the camera
        }
    }
    
    // Create the coordinator
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Create the UIImagePickerController
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera // Use the camera
        picker.delegate = context.coordinator // Set the coordinator as the delegate
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No need to update anything dynamically
    }
}

struct CameraResultsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var result: Int = 0
    @State var receivedAnalysis = false
    @State var parseError = ""
    @Binding var image: UIImage?
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                Text("You picked up \(result) pieces of trash!")
                VStack {
                    HStack {
                        
                        
                        Image(systemName: "sparkle")
                            .foregroundColor(.purple)
                        Text("+\(result * 10) power")
                    }
                    
                    
                }
                .padding()
                .background(
                    Rectangle()
                        .foregroundColor(.primary)
                        .cornerRadius(15)
                        .opacity(0.07)
                )
                .padding(.horizontal)
                VStack {
                    HStack {
                        
                        
                        Image(systemName: "rosette")
                            .foregroundColor(.yellow)
                        Text("+\(result) tokens")
                    }
                   
                    
                    
                }
                .padding()
                .background(
                    Rectangle()
                        .foregroundColor(.primary)
                        .cornerRadius(15)
                        .opacity(0.07)
                )
                .padding(.horizontal)
                Button(action: {
                    image = nil
                }) {
                    VStack {
                        HStack {
                            Text("Done")
                        }
                        
                    }
                    .padding()
                    .background(
                        Rectangle()
                            .foregroundColor(.accent)
                            .cornerRadius(15)
                            .opacity(0.3)
                    )
                    .padding(.horizontal)
                }
                .padding(.top, 20)
                Spacer()
            }
            Spacer()
        }
        .background(
            Rectangle()
                .foregroundStyle(colorScheme == .dark ? .black : .white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
        .font(.system(size: 20, design: .rounded))
        .onAppear() {
            receivedAnalysis = false
    
                
                
            CameraApi().getCamera(image: image ?? nil) { (result, parseError) in
                    self.result = result
           
                    receivedAnalysis = true
                    self.parseError = parseError
                  
                    if parseError == "no error" {
                        
                        
                    }
                    else {
                        
                        
                    }
                   
                }
            
        }
    }
}
    
 

//struct CameraParentView: View {
//    @State var showCamera = false
//    @State var capturedImage: UIImage?
//    
//    var body: some View {
//        VStack {
//            if let image = capturedImage {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 300)
//            } else {
//                Text("No Image Captured")
//                    .font(.headline)
//                    .foregroundColor(.gray)
//            }
//            
//            Button(action: {
//                showCamera = true
//            }) {
//                Text("Open Camera")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding()
//            .sheet(isPresented: $showCamera) {
//                CameraView(isShown: $showCamera, image: $capturedImage)
//            }
//        }
//        .padding()
//    }
//}
//

//#Preview {
//    CameraParentView()
//}
