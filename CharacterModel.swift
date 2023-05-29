//
//  CharacterModel.swift
//  Rick & Morty
//
//  Created by Rafa on 10/05/2023.
//

import Foundation

struct CharacterModel: Decodable{
    let name: String
    let status: String
    let species: String
    let image: String
}
