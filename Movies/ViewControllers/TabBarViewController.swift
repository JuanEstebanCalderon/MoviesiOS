//
//  TabBarView.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 30/10/24.
//
import UIKit
import SwiftUI

class TabBarViewController: UITabBarController {
    let navBarTitle = CustomLabel(text: "CineMark", font: .systemFont(ofSize: 20, weight: .bold), numberOfLines: 1, aligment: .center)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    private func setupTabs() {
        let moviesList = createNav(with: "Peliculas", and: UIImage(systemName: "square.split.2x2.fill"), viewController: MoviesListViewController())
        let moviesFavorites = createNav(with: "Favoritos", and: UIImage(systemName: "star"), viewController: FavoritesMoviesViewController())
        setViewControllers([moviesList, moviesFavorites], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, viewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }

}

extension TabBarViewController {
    private func layout() {
        tabBar.backgroundColor = .systemBackground
        tabBar.isTranslucent = false
        view.addSubview(navBarTitle)
        NSLayoutConstraint.activate([
            navBarTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            navBarTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navBarTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        setupTabs()
    }
}
