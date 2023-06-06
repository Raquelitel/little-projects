//
//  CharacterView.swift
//  little-projects
//
//  Created by Raquel on 6/6/23.
//

import SwiftUI



struct CharacterView: View {
    
    var char: Character
    
    
    var body: some View {
        ZStack{
            Image(systemName: "persona.fill")
                .data(url: URL(string: char.Imagen)!)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .position(x:400, y:100)
            Image(systemName: "persona.fill")
                .data(url: URL(string: char.Imagen)!)
                .position(x:80, y:400)
            
            VStack{
                Text(char.Nombre)
                    .font(.title3)
                    .textCase(.uppercase)
                    .frame(alignment: .top)
                    .padding()
                Text(char.Historia)
                    .font(.body)
                    .padding()
                    
                
            }
            .frame(width: 300)
            .frame(minHeight: 200)
            .background(Color.yellow)
            .cornerRadius(10)


        }
        .shadow(radius: 5)
    }
}




//struct CharacterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterView()
//    }
//}
