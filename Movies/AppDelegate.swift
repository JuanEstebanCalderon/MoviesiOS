//
//  AppDelegate.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 24/10/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [
        UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            window?.backgroundColor = .orange
            // window?.rootViewController = MovieDetailViewController(movie: Movie(id: 1, title: "",release_date: "",genres: [""], overview: "",favorite: false,vote_average: 0,poster_path: URL(string: "")))
            window?.rootViewController = MoviesListViewController()
            return true
        }
}

