//
//  SearchBar.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 29/10/24.
//
import UIKit
import SwiftUI

class SearchBarView: UIView {
    lazy var container = UIView()
    lazy var divider1 = UIView()
    lazy var divider2 = UIView()
    lazy var searchBar = UISearchBar()
    
    var onSearchTextChanged: ((String) -> Void)?
    var onSearchButtonPressed: ((String) -> Void)?
    
    init() {
        super.init(frame: .zero)
        style()
        layout()
        searchBar.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("Initiacoder:) has not been implemented")
    }
    
}

extension SearchBarView {
    
    private func style() {
        searchBar.placeholder = "Search Movies"
        divider1.backgroundColor = .systemGray
        divider1.translatesAutoresizingMaskIntoConstraints = false
        divider2.backgroundColor = .systemGray
        divider2.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(divider1)
        addSubview(searchBar)
        addSubview(divider2)
        NSLayoutConstraint.activate([
            divider1.heightAnchor.constraint(equalToConstant: 1),
            divider1.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider1.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 6),
            searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -5),
            searchBar.heightAnchor.constraint(equalToConstant: 30),
            divider2.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 6),
            divider2.heightAnchor.constraint(equalToConstant: 1),
            divider2.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider2.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

// MARK: UISearchBarDelegate
extension SearchBarView: UISearchBarDelegate {
    func searchBar(_ searchbar: UISearchBar, textDidChange searchText: String) {
        self.onSearchTextChanged?(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchbar: UISearchBar) {
        guard let searchText = searchbar.text else { return }
        self.onSearchButtonPressed?(searchText)
    }
}

// MARK: Actions
extension SearchBarView {
    @objc func handleButtonCancel(sender: UIButton) {
        
    }
}

struct SearchBarRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> SearchBarView {
        let view = SearchBarView()
        return view
    }
    
    func updateUIView(_ uiView: SearchBarView, context: Context) {
        
    }
}

struct SearchBarViewPreview: PreviewProvider {
    static var previews: some View { SearchBarRepresentable() }
}
