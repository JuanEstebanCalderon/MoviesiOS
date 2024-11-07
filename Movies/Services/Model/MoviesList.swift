//
//  MoviesList.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 28/10/24.
//
import Foundation

struct MoviesList: Decodable {
    var page: Int = 0
    var results: [Movie]?
}
