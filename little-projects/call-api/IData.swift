//
//  IData.swift
//  little-projects
//
//  Created by Raquel on 31/5/23.
//

import Foundation

struct IData: Decodable {
    var result: [Character]
}

struct Character: Decodable {
    var _id: String
    var Nombre: String
    var Historia: String
    var Imagen: String
    var Genero: String
    var Estado: String
    var Ocupacion: String

}

