//
//  SearchBar.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 29/10/24.
//
import UIKit
import SwiftUI

class SearchBarView: UIView {
    let divider1 = UIView()
    let divider2 = UIView()
    let searchLogo = UIButton()
    let cancelLogo = UIButton()
    let textField = UITextField ()
    lazy var searchBarStack = CustomStack(axis: .horizontal, aligment: .center, distribution: .fill, spacing: 10)
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("Initial Code:) has not been implemented")
    }
}

extension SearchBarView {
    private func style() {
        searchLogo.setImage(UIImage(systemName: "magnifyingglass"), for: [])
        cancelLogo.setImage(UIImage(systemName: "xmark.circle.fill"), for: [])
        searchLogo.tintColor = .systemGray
        cancelLogo.tintColor = .systemGray
        textField.placeholder = "Busqueda peliculas"
        searchBarStack.backgroundColor = .systemGray5
        searchBarStack.layer.cornerRadius = 10
        searchBarStack.clipsToBounds = true
        divider1.backgroundColor = .systemGray4
        divider1.translatesAutoresizingMaskIntoConstraints = false
        divider2.backgroundColor = .systemGray4
        divider2.translatesAutoresizingMaskIntoConstraints = false
        searchBarStack.isLayoutMarginsRelativeArrangement = true
        searchBarStack.layoutMargins = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        cancelLogo.isHidden = true
        
    }
    private func layout() {
        searchBarStack.addSubViews([searchLogo, textField, cancelLogo])
        addSubview(divider1)
        addSubview(searchBarStack)
        addSubview(divider2)
        NSLayoutConstraint.activate([
            divider1.heightAnchor.constraint(equalToConstant: 1),
            divider1.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            divider1.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider1.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchLogo.widthAnchor.constraint(equalToConstant: 20),
            cancelLogo.widthAnchor.constraint(equalToConstant: 20),
            searchBarStack.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 10),
            searchBarStack.heightAnchor.constraint(equalToConstant: 35),
            searchBarStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            searchBarStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
            divider2.topAnchor.constraint(equalTo: searchBarStack.bottomAnchor, constant: 10),
            divider2.heightAnchor.constraint(equalToConstant: 1),
            divider2.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider2.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

// MARK: UITextFieldDelagate
extension SearchBarView: UITextFieldDelegate {
    
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
