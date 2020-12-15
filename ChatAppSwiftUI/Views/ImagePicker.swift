//
//  ImagePicker.swift
//  ChatAppSwiftUI
//
//  Created by Mohammed on 12/14/20.
//


import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: Data
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
    
    // Connecting the Coordinator class with this struct
        func makeCoordinator() -> Coordinator {
            return Coordinator(picker: self)
        }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
     
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: ImagePicker
    
    init(picker: ImagePicker) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage.jpegData(compressionQuality: 0.45)!
        self.picker.isPresented.wrappedValue.dismiss()
    }
    
}

//struct ImagePicker : UIViewControllerRepresentable {
//
//    @Binding var picker : Bool
//    @Binding var imagedata : Data
//
//    func makeCoordinator() -> ImagePicker.Coordinator {
//
//        return ImagePicker.Coordinator(parent1: self)
//    }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
//
//        let picker = UIImagePickerController()
//        picker.sourceType = .photoLibrary
//        picker.delegate = context.coordinator
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
//
//
//    }
//
//    class Coordinator : NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
//
//        var parent : ImagePicker
//
//        init(parent1 : ImagePicker) {
//
//            parent = parent1
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//
//            self.parent.picker.toggle()
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//
//            let image = info[.originalImage] as! UIImage
//
//            let data = image.jpegData(compressionQuality: 0.45)
//
//            self.parent.imagedata = data!
//
//            self.parent.picker.toggle()
//        }
//    }
//}
