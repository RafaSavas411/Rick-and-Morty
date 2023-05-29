//
//  CharacterDetailModalCoordinator.swift
//  Rick & Morty
//
//  Created by Rafa on 23/05/2023.
//

import Foundation
import UIKit

class CharacterDetailModalCoordinator: Coordinator {
    let characterModel: CharacterModel
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?, characterModel: CharacterModel) {
        self.navigationController = navigationController
        self.characterModel = characterModel
    }
    
    func start() {
        let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
        viewController?.present(characterDetailViewController, animated: true)
    }
}
