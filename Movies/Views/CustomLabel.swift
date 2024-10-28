//
//  LabelCustom.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 27/10/24.
//

import UIKit

class CustomLabel: UILabel {
    
    init(text: String = "Insert text", font: UIFont = .systemFont(ofSize: 20), numberOfines: Int = 0, heightConstrain: Bool = false, aligment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = font
        self.numberOfLines = numberOfines
        self.textAlignment = aligment
    }
    
    required init?(coder: NSCoder) {
        fatalError("initialcode:) has not been implemented")
    }
}
