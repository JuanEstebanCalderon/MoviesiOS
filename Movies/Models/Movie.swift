//
//  Movie.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 27/10/24.
//

import Foundation 

struct Movie {
    var poster: URL?
    var title: String
    var releaseDate: String
    var genres: [String]
    var description: String
    var favorite: Bool
    init(poster: String, title: String, releaseDate: String, genres: [String], description: String, favorite: Bool = false) {
        self.poster = URL(string: poster)
        self.title = title
        self.releaseDate = releaseDate
        self.genres = []
        self.description = description
        self.favorite = favorite
    }
}
