//
//  ImagePicker.swift
//  little-projects
//
//  Created by Raquel on 18/8/23.
//

// CÓDIGO GENÉRICO PARA CONECTARNOS A LA CÁMARA

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var show: Bool
    @Binding var image: Data
    var source: UIImagePickerController.SourceType
    
    // en esta función, el .Coordinator es la clase Coordinator que tenemos más abajo
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator(conexion: self)
    }
    
    // función preexistente para conectarnos con la imagen
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.allowsEditing = true
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        // esta variable debe ser del tipo de la Struct
        var conexion: ImagePicker
        
        init(conexion: ImagePicker) {
            self.conexion = conexion
        }
        
        // Se ejecuta cuando cancelamos la opción de tomar la foto
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print("Se canceló")
            self.conexion.show.toggle()
        }
        
        // se toma la fotografía
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            let data = image.jpegData(compressionQuality: 0.100)
            self.conexion.image = data!
            self.conexion.show.toggle()
        }
    }
}
