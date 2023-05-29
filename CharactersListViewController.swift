//
//  ViewController.swift
//  Rick & Morty
//
//  Created by Rafa on 10/05/2023.
//

import UIKit

class CharactersListViewController: UIViewController {
    //lo cambie para no hacer un unwrap forzoso
//    var mainView: CharactersListView? { self.view as? CharactersListView }
    var mainView: CharactersListView? {
        return self.view as? CharactersListView
    }
    let apiClient = ListOfCharactersAPIClient()
    private var tableViewDataSource: ListOfCharactersTableViewDataSource?
    private var tableViewDelegate: ListOfCharactersTableViewDelegate?
    
    //para que cuando entramos al personaje nos ponga el boton de atras del sistema para volver atras
    var characterDetailCoordinator: CharacterDetailPushCoordinator?
//    var characterDetailCoordinator: CharacterDetailModalCoordinator?

        //se saco esto y se puso lo de abajo por lo mismo de arriba del unwrap forzoso
//    override func loadView() {
//        view = CharactersListView()
//        tableViewDelegate = ListOfCharactersTableViewDelegate()
//
//        tableViewDataSource = ListOfCharactersTableViewDataSource(tableView: mainView.charactersTableView)
//        mainView.charactersTableView.dataSource = tableViewDataSource
//        mainView.charactersTableView.delegate = tableViewDelegate
    
//    }
    override func loadView() {
        view = CharactersListView()
        tableViewDelegate = ListOfCharactersTableViewDelegate()
        
        if let tableView = mainView?.charactersTableView {
            tableViewDataSource = ListOfCharactersTableViewDataSource(tableView: tableView)
            tableView.dataSource = tableViewDataSource
            tableView.delegate = tableViewDelegate
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            print("Index \(index)")
            
            //Present New View Controller
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            
//            let characterModel = dataSource.characters[index]
//            let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
//            self?.present(characterDetailViewController, animated: true)
            
            let characterModel = dataSource.characters[index]
            self?.characterDetailCoordinator = CharacterDetailPushCoordinator(navigationController: self?.navigationController, characterModel: characterModel)
            
            self?.characterDetailCoordinator?.start()
        }
// es necesario cambiar esto por lo de abajo porque se debe handlear el error por lo que hicimos en el API Client
//        Task {
//            let characters = await apiClient.getListOfCharacters()
//            print("Characters \(characters)")
//            tableViewDataSource?.set(characters: characters.results)
//        }
        Task {
            do {
                let characters = try await apiClient.getListOfCharacters()
                print("Characters \(characters)")
                tableViewDataSource?.set(characters: characters.results)
            } catch {
                // se handlea el error
                print("Error: \(error)")
            }
        }

        
    }
}

