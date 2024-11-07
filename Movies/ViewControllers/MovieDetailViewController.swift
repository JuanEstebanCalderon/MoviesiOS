//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 27/10/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie: Movie
    private var movieDetailView: MovieDetailView!
    
    // Initialize with a movie model
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        movieDetailView = MovieDetailView(favoriteStarTapped: favoriteMovieStarTapped)
        self.view = movieDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension MovieDetailViewController {
    private func configureView() {
        movieDetailView.movieMainContent.movieTitle.text = movie.title
        movieDetailView.movieMainContent.movieReleaseDate.text = movie.release_date
        movieDetailView.movieDescripton.text = movie.overview
        movieDetailView.movieGenres.text = movie.genres?.joined(separator: ", ") ?? ""
       // movieDetailView.poster.image = UIImage(named: movie.posterImage)
    }
    
    private func style() {
        
    }
    
    private func layout() {
        
    }
}
//MARK: Actions
extension MovieDetailViewController {
    func favoriteMovieStarTapped() {
        movie.favorite.toggle()
        let star = movie.favorite ? "star.fill" : "star"
        let image = UIImage(systemName: star)
        movieDetailView.favoriteStarBtn.setImage(image, for: [])
    }
}
