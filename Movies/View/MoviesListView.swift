//
//  MoviesListView.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 1/11/24.
//

import UIKit
import SwiftUI

class MoviesListView: UIView {
    private lazy var barSearch = SearchBarView()
    lazy var moviesListCollectionView = UICollectionView()
    
    init() {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Initialcodes:) has not been implemented")
    }
    
}
extension MoviesListView {
    private func style() {
        
    }
    
    private func layout() {
        addSubview(barSearch)
        barSearch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            barSearch.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            barSearch.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            barSearch.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            barSearch.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
}
struct MoviesListRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> MoviesListView {
        let view = MoviesListView()
        return view
    }
    
    func updateUIView(_ uiView: MoviesListView, context: Context) {
        
    }
}

struct MoviesListPreview: PreviewProvider {
    static var previews: some View { MoviesListRepresentable() }
}
