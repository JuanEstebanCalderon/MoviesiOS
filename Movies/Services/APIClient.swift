//
//  APIClient.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 1/11/24.
//
import Foundation
final class ListOfMoviesApiClient {
    func getListOfMovies() async -> MoviesList {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=176de15e8c8523a92ff640f432966c9c&language=es")!
        let(data, _) = try! await URLSession.shared.data(from: url)
        let model = try! JSONDecoder().decode(MoviesList.self, from: data)
        return model
    }
}
