//
//  MovieView.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 6/11/24.
//

import UIKit
import SwiftUI

class MovieView: UIView {
    lazy var movieContainer = UIView()
    lazy var movieImage = ImageCustom(cornerRadius: 10, contentMode: .scaleAspectFit)
    lazy var movieInfoStack = StackCustom(axis: .vertical, aligment: .leading, distribution: .fillProportionally, spacing: 5)
    lazy var movieTitle = TitleLabel()
    lazy var movieTitleDate = InfoLabel(text: "Fecha de lanzamiento:")
    lazy var movieReleaseDate = InfoLabel()
    lazy var movieStarsStack = StackCustom(axis: .horizontal, aligment: .top, distribution: .equalSpacing)
    
    init() {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("InitialCoder:) has not been implemented")
    }
}
extension MovieView {
    private func style() {
        movieContainer.backgroundColor = .systemGray4
        movieImage.backgroundColor = .systemGray5
        movieStarsStack.backgroundColor = .systemGray5
    }
    
    private func layout() {
        movieInfoStack.addSubViews([movieTitle, movieTitleDate, movieReleaseDate])
        movieContainer.translatesAutoresizingMaskIntoConstraints = false
        movieContainer.addSubview(movieInfoStack)
        movieContainer.addSubview(movieImage)
        movieContainer.addSubview(movieStarsStack)
        self.addSubview(movieContainer)
        NSLayoutConstraint.activate([
            movieContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            movieContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            movieContainer.heightAnchor.constraint(equalToConstant: 250),
            movieImage.topAnchor.constraint(equalTo: movieContainer.topAnchor, constant: 20),
            movieImage.leadingAnchor.constraint(equalTo: movieContainer.leadingAnchor, constant: 10),
            movieImage.bottomAnchor.constraint(equalTo: movieContainer.bottomAnchor, constant: -20),
            movieImage.widthAnchor.constraint(equalToConstant: 140),
            movieInfoStack.topAnchor.constraint(equalTo: movieImage.topAnchor),
            movieInfoStack.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 15),
            movieInfoStack.trailingAnchor.constraint(equalTo: movieContainer.trailingAnchor, constant: -10),
            movieStarsStack.topAnchor.constraint(equalTo: movieInfoStack.bottomAnchor, constant: 5),
            movieStarsStack.leadingAnchor.constraint(equalTo: movieInfoStack.leadingAnchor),
            movieStarsStack.trailingAnchor.constraint(equalTo: movieInfoStack.trailingAnchor),
            movieStarsStack.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
}

struct MovieViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> MovieView {
        let view = MovieView()
        return view
    }
    
    func updateUIView(_ uiView: MovieView, context: Context) {
        
    }
}

struct MovieViewPreview: PreviewProvider {
    static var previews: some View { MovieViewRepresentable() }
}
