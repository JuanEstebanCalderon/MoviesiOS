//
//  TitleLabel.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 7/11/24.
//

import UIKit
class TitleLabel: UILabel {
    init(text: String = "Insert Text") {
        super.init(frame: .zero)
        self.text = text
        self.font = .systemFont(ofSize: 28, weight: .bold)
        self.numberOfLines = 1
        self.textAlignment = .left
        self.lineBreakMode = .byWordWrapping
    }
    required init?(coder: NSCoder) {
        fatalError("InitialCoder:) has not been implemented")
    }
}
