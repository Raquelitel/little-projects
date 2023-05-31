//
//  IData.swift
//  little-projects
//
//  Created by Raquel on 31/5/23.
//

import Foundation

struct IData: Codable {
    let id: Int
    let films, shortFilms, tvShows, videoGames: [String]
    let parkAttractions: [String]
    let sourceURL: String
    let name: String
    let imageURL: String
    let createdAt: String
    let updatedAt: String
    let url: String
    let v: Int
}
