//
//  CharacteraListView.swift
//  Rick & Morty
//
//  Created by Rafa on 10/05/2023.
//

import Foundation
import UIKit

//creamos nuestra lista charactersListView
class CharactersListView: UIView {
    //que contiene la vista tableView
    let charactersTableView: UITableView = {
        //creamos la propiedad
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CharacterListCellView.self, forCellReuseIdentifier: "CharacterListCellView")
        return tableView
    }()//por que van los parentesis aca al final?
    
    //creamos los inicializadores de la propiedad
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //creamos el metodo setupView el cual se encarga de añadir la tableView a la vista
    func setupView() {
        addSubview(charactersTableView)
        
        //y se aplican las constraints
        NSLayoutConstraint.activate([
            charactersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            charactersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            charactersTableView.topAnchor.constraint(equalTo: topAnchor),
            charactersTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
