//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 26/10/24.
//

import UIKit
import SwiftUI

class MovieDetailView: UIView {
    lazy var movieMainContent = MovieView()
    private var favoriteMovieStarTapped: (() -> Void)?
    lazy var favoriteStarBtn = UIButton()
    lazy var barStack = StackCustom(axis: .horizontal, aligment: .fill, distribution: .equalSpacing)
    lazy var backArrow = UIButton()
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    lazy var movieDescripton = InfoLabel()
    lazy var movieGenres = InfoLabel()
    
    private func barDetailMovie(){
        favoriteStarBtn.setImage(UIImage(systemName: "star"), for: .normal)
        favoriteStarBtn.tintColor  = .systemYellow
        favoriteStarBtn.addTarget(self, action: #selector(starTapped), for: .touchUpInside)
        backArrow.setImage(.init(systemName: "chevron.left"), for: .normal)
        backArrow.tintColor = .black
        let title = CustomLabel(text: "Detalle Película", font: .systemFont(ofSize: 20, weight: .bold))
        barStack.addSubViews([backArrow, title, favoriteStarBtn])
        self.addSubview(barStack)
    }
    
    
    private func setupInfoMovie() {
        let genresTitle = SubTitleLabel(text: "Generos:")
        let descriptionTitle = SubTitleLabel(text: "Descripcion:")
        let genresStack = StackCustom(axis: .vertical, aligment: .leading, distribution: .fill, spacing: 5)
        let descriptionStack = StackCustom(axis: .vertical, aligment: .leading, distribution: .fill, spacing: 5)
        descriptionStack.addSubViews([descriptionTitle, movieDescripton])
        genresStack.addSubViews([genresTitle, movieGenres])
        scrollView.addSubview(genresStack)
        scrollView.addSubview(descriptionStack)
        NSLayoutConstraint.activate([
            genresStack.topAnchor.constraint(equalTo: movieMainContent.bottomAnchor, constant: 10),
            genresStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            genresStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            descriptionStack.topAnchor.constraint(equalTo: genresStack.bottomAnchor, constant: 10),
            descriptionStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            descriptionStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10)
        ])
    }
    
    private func setupScrollView() {
        scrollView.addSubview(movieMainContent)
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    init(favoriteStarTapped: @escaping (() -> Void)) {
        super.init(frame: .zero)
        backgroundColor = .white
        self.favoriteMovieStarTapped = favoriteStarTapped
        barDetailMovie()
        setupScrollView()
        setupInfoMovie()
        layout()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("initcode:) has not been implemented")
    }
}

extension MovieDetailView {
    
    func style() {
    }
    
    func layout() {
        movieMainContent.translatesAutoresizingMaskIntoConstraints = false
        //Detail Bar stack
        NSLayoutConstraint.activate([
            barStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            barStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            barStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            barStack.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        // Main content
        NSLayoutConstraint.activate([
            movieMainContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            movieMainContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            movieMainContent.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        // ScrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: barStack.bottomAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
// MARK: Actions
extension MovieDetailView {
    @objc func starTapped(sender: UIButton) {
        self.favoriteMovieStarTapped?()
    }
}

struct MovieDetailViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> MovieDetailView {
        let view = MovieDetailView(favoriteStarTapped: {})
        return view
    }
    
    func updateUIView(_ uiView: MovieDetailView, context: Context) {
        
    }
}

struct NMovieDetailViewPreview: PreviewProvider {
    static var previews: some View { MovieDetailViewRepresentable() }
}
