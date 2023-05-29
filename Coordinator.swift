//
//  Coordinator.swift
//  Rick & Morty
//
//  Created by Rafa on 17/05/2023.
//

import Foundation
import UIKit

protocol Coordinator {
    var viewController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    
    func start()
}

extension Coordinator {
    var viewController: UIViewController? { nil }
    var navigationController: UINavigationController? { nil }
}


