//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 27/10/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
    let favoriteStarBtn = UIButton()
    private var movie: Movie
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
        movieDetailView = MovieDetailView()
        self.view = movieDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension MovieDetailViewController {
    private func configureView() {
        favoriteStarBtn.setImage(.init(systemName: "star"), for: .normal)
        favoriteStarBtn.tintColor  = .systemYellow
        favoriteStarBtn.addTarget(self, action: #selector(starTapped), for: .touchUpInside)
        movieDetailView.barStack.addSubViews([favoriteStarBtn])
        movieDetailView.movieTitle.text = movie.title
        movieDetailView.movideDate.text = movie.releaseDate
        movieDetailView.movieDescripton.text = movie.description
        movieDetailView.movieGenres.text = movie.genres.joined(separator: ", ")
        // Assuming you have a method to load the image based on the image name
        //movieDetailView.poster.image = UIImage(named: movie.posterImage)
    }
    
    private func style() {
        
    }
    
    private func layout() {
        
    }
}
//MARK: Actions
extension MovieDetailViewController {
    @objc func starTapped(sender: UIButton) {
        movie.favorite.toggle()
        let star = movie.favorite ? "star.fill" : "star"
        let image = UIImage(systemName: star)
        favoriteStarBtn.setImage(image, for: [])
    }
}
