//
//  Movie.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 27/10/24.
//

import Foundation

struct Movie: Decodable {
    var id: Int
    var title: String?
    var release_date: String?
    var genres: [String]?
    var overview: String?
    var favorite: Bool = false
    var vote_average: Double?
    var poster_path: URL?
}
