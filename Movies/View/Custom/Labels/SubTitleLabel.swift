//
//  SubTitleLabel.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 7/11/24.
//

import UIKit

class SubTitleLabel: UILabel {
    init(text: String = "Insert Text") {
        super.init(frame: .zero)
        self.text = text
        self.font = .systemFont(ofSize: 22, weight: .medium)
        self.numberOfLines = 1
        self.textAlignment = .left
        self.lineBreakMode = .byWordWrapping
    }
    required init?(coder: NSCoder) {
        fatalError("InitialCoder:) has not been implemented")
    }
}
