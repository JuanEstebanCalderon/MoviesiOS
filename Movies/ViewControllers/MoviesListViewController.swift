//
//  MoviesViewController.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 30/10/24.
//

import UIKit

class MoviesListViewController: UIViewController {
    private var search: SearchBarView!
    
    init() {
        search = SearchBarView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        layout()
    }
    
    func layout () {
        view.addSubview(search)
        search.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            search.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            search.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            search.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            search.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
