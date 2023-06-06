//
//  ApiDataListView.swift
//  little-projects
//
//  Created by Raquel on 31/5/23.
//

import SwiftUI

struct ApiDataListView: View {
    
    @StateObject var json = getDataList()
    
    var body: some View {
            if json.dataList.result.isEmpty {
                ZStack{
                    Color.yellow
                    VStack{
                        Image("theSimpsons")
                            .resizable()
                            .frame(height: 200)

                        ProgressView()
                    }
                }
                .ignoresSafeArea()
               
            } else {
                NavigationView{
                List(json.dataList.result, id: \.Nombre){ item in
                    NavigationLink(destination: CharacterView(char: item)){
                        HStack{
                            Image(systemName: "persona.fill")
                                .data(url: URL(string: item.Imagen)!)
                                .frame(width: 50, height: 50)
                                .background(Color.yellow.opacity(0.8))
                                .clipped()
                                .clipShape(Circle())
                            
                            Text(item.Nombre)
                            
                        }
                    }
                }
                .navigationTitle("The Simpsons")
            }
        }
    }
}

extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url){
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}


struct ApiDataListView_Previews: PreviewProvider {
    static var previews: some View {
        ApiDataListView()
    }
}
