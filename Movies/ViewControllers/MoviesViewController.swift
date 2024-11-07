//
//  MoviesCollectionViewController.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 28/10/24.
//

import UIKit

class MoviesViewController: UIViewController {
    
    private var moviesList: MoviesList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moviesList = MoviesList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Initialcode:) has not been implemented")
    }
}
