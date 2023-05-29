//
//  API Client.swift
//  Rick & Morty
//
//  Created by Rafa on 10/05/2023.
//

import Foundation

//final class ListOfCharactersAPIClient {
//    func getListOfCharacters () async -> CharacterModelResponse {
//        //llamamos a la url que le vamos a hacer la peticion
//        let url = URL(string: "https://rickandmortyapi.com/api/character")!
//        //hacemos la peticion y una vez que tenemos data
//        let (data, _) = try! await URLSession.shared.data(from: url)
//        //ya obtenida data tenemos que parsear los datos obtenido a un modelo de nuestro dominio
//        return try! JSONDecoder().decode(CharacterModelResponse.self, from: data)
//    }
//}

final class ListOfCharactersAPIClient {
    func getListOfCharacters() async throws -> CharacterModelResponse {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(CharacterModelResponse.self, from: data)
            return response
        } catch {
            throw APIError.invalidResponse
        }
    }
}

// Define custom errors
enum APIError: Error {
    case invalidURL
    case invalidResponse
}

