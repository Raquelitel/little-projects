//
//  AddImageView.swift
//  little-projects
//
//  Created by Raquel on 18/8/23.
//

import SwiftUI

struct AddImageView: View {
    
    @State private var imageData : Data = .init(capacity: 0)
    @State private var mostrarMenu = false
    @State private var imagePicker = false
    @State private var source: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("")
                    .navigationDestination(isPresented: $imagePicker){
                        ImagePicker(show: self.$imagePicker, image: self.$imageData, source: self.source)
                    }.toolbar(.hidden)

                Button(action:{
                    mostrarMenu.toggle()
                }){
                    Text("Cargar Imagen")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .bold()
                }.actionSheet(isPresented: $mostrarMenu, content: {
                    ActionSheet(title: Text("Menu"), message: Text("Selecciona una opción"), buttons: [
                        .default(Text("Camara"), action: {
                            source = .camera
                            imagePicker.toggle()
                        }),
                        .default(Text("Galería"), action: {
                            source = .photoLibrary
                            imagePicker.toggle()
                        }),
                        .default(Text("Cancelar"))
                    ])
                })
                
                if imageData.count != 0 {
                    Image(uiImage: UIImage(data: imageData)!)
                        .resizable()
                        .frame(width: 250, height: 250)
                        .cornerRadius(15)
                }
            }
        }
    }
}

