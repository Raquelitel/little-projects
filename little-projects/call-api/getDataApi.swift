//
//  getDataApi.swift
//  little-projects
//
//  Created by Raquel on 31/5/23.
//

import Foundation

class getDataList: ObservableObject {
    
    @Published var dataList = IData(result: [])
    
    init(){
        fetch()
    }
    
    func fetch(){
        guard let url = URL(string: "https://apisimpsons.fly.dev/api/personajes/find/simpson") else {return}
        
        URLSession.shared.dataTask(with: url){data,_,_ in
            
            guard let data = data else { return }
            
            do{
                let json = try JSONDecoder().decode(IData.self, from: data)
                DispatchQueue.main.async {
                    self.dataList = json
                }
                
            } catch let error as NSError{
                print("error obtenido \(error)")
            }
            
        }.resume()
    }
}
