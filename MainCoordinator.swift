//
//  MainCoordinator.swift
//  Rick & Morty
//
//  Created by Rafa on 17/05/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let listOfCharactersViewController = storyboard.instantiateViewController(withIdentifier: "CharactersListViewController")

        navigationController?.pushViewController(listOfCharactersViewController, animated: true)
    }
}
