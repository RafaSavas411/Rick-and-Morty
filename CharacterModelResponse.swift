//
//  CharacterModelResponse.swift
//  Rick & Morty
//
//  Created by Rafa on 10/05/2023.
//

import Foundation

struct CharacterModelResponse: Decodable {
    let results: [CharacterModel]
}
