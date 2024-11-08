//
//  WarningInfoLabel.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 7/11/24.
//

import UIKit

class WarningInfoLabel: UILabel {
    init(text: String = "insert text") {
        super.init(frame: .zero)
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = .italicSystemFont(ofSize: 20)
        self.numberOfLines = 0
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("InitialCoder:) has not been implemented")
    }
}
