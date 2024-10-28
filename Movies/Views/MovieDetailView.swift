//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 26/10/24.
//

import UIKit
import SwiftUI

class MovieDetailView: UIView {
    
    lazy var barStack = CustomStack(axis: .horizontal, aligment: .fill, distribution: .equalSpacing)
    lazy var backArrow = UIButton()
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var mainContent = UIView()
    lazy var poster = CustomImage(cornerRadius: 15)
    lazy var movieTitle = CustomLabel()
    lazy var movideDate = CustomLabel()
    lazy var movieDescripton = CustomLabel()
    lazy var movieGenres = CustomLabel()
    lazy var starStack = CustomStack(axis: .horizontal, aligment: .top, distribution: .equalSpacing)
    
    private func barDetailMovie(){
        backArrow.setImage(.init(systemName: "chevron.left"), for: .normal)
        backArrow.tintColor = .black
        let title = CustomLabel(text: "Detalle Película", font: .systemFont(ofSize: 20, weight: .bold))
        barStack.addSubViews([backArrow, title])
        self.addSubview(barStack)
    }
    
    private func setupMainContent() {
        scrollView.addSubview(mainContent)
        mainContent.translatesAutoresizingMaskIntoConstraints = false
        let infoStack = CustomStack(axis: .vertical,
                                    aligment: .leading,
                                    distribution: .fill)
        [poster, infoStack, starStack].forEach { mainContent.addSubview($0) }
        movieTitle.font = .systemFont(ofSize: 24, weight: .bold)
        let dateTitle = CustomLabel(text: "Fecha de lanzamiento:", font: .systemFont(ofSize: 14, weight: .light))
        movideDate.font = .systemFont(ofSize: 14, weight: .light)
        infoStack.addSubViews([movieTitle, dateTitle, movideDate])
        NSLayoutConstraint.activate([
            infoStack.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 10),
            infoStack.trailingAnchor.constraint(equalTo: mainContent.trailingAnchor, constant: -10),
            infoStack.topAnchor.constraint(equalTo: poster.topAnchor, constant:  0),
        ])
    }
    
    private func setupInfoMovie() {
        let genresTitle = CustomLabel(text: "Generos:", font: .systemFont(ofSize: 22), aligment: .justified)
        let descriptionTitle = CustomLabel(text: "Descripcion:", font: .systemFont(ofSize: 22))
        let genresStack = CustomStack(axis: .vertical, aligment: .leading, distribution: .fill, spacing: 5)
        let descriptionStack = CustomStack(axis: .vertical, aligment: .leading, distribution: .fill, spacing: 5)
        movieDescripton.font = .systemFont(ofSize: 16, weight: .light)
        movieGenres.font = .systemFont(ofSize: 16, weight: .light)
        descriptionStack.addSubViews([descriptionTitle, movieDescripton])
        genresStack.addSubViews([genresTitle, movieGenres])
        scrollView.addSubview(genresStack)
        scrollView.addSubview(descriptionStack)
        NSLayoutConstraint.activate([
            genresStack.topAnchor.constraint(equalTo: mainContent.bottomAnchor, constant: 0),
            genresStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            genresStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            descriptionStack.topAnchor.constraint(equalTo: genresStack.bottomAnchor, constant: 10),
            descriptionStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            descriptionStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10)
        ])
    }
    
    private func setupScrollView() {
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        barDetailMovie()
        setupScrollView()
        setupMainContent()
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
        poster.backgroundColor = .secondarySystemBackground
    }
    
    func layout() {
        //Detail Bar stack
        NSLayoutConstraint.activate([
            barStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            barStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            barStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            barStack.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        // Poster
        NSLayoutConstraint.activate([
            poster.topAnchor.constraint(equalTo: mainContent.topAnchor, constant: 20),
            poster.leadingAnchor.constraint(equalTo: mainContent.leadingAnchor, constant: 10),
            poster.bottomAnchor.constraint(equalTo: mainContent.bottomAnchor, constant: -20),
            poster.widthAnchor.constraint(equalToConstant: 140),
        ])
        // Main content
        NSLayoutConstraint.activate([
            mainContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            mainContent.heightAnchor.constraint(equalToConstant: 250),
            starStack.widthAnchor.constraint(equalToConstant: 20),
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

struct MovieDetailRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> MovieDetailView {
        let view = MovieDetailView()
        return view
    }
    
    func updateUIView(_ uiView: MovieDetailView, context: Context) {
        
    }
}

struct MovieDetailViewPreview: PreviewProvider {
    static var previews: some View { MovieDetailRepresentable() }
}
