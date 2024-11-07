//
//  SubTitleLabel.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 7/11/24.
//
import UIKit

class InfoLabel: UILabel {
    init(text: String = "Insert Text") {
        super.init(frame: .zero)
        self.text = text
        self.font = .systemFont(ofSize: 16, weight: .light)
        self.numberOfLines = 1
        self.textAlignment = .left
        self.lineBreakMode = .byWordWrapping
    }
    required init?(coder: NSCoder) {
        fatalError("InitialCoder:) has not been implemented")
    }
}
