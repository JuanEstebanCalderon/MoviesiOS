//
//  CustomImage.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 26/10/24.
//

import UIKit

class ImageCustom: UIImageView {
    init(image: UIImage? = .init(systemName: "photo.circle.fill"), cornerRadius: CGFloat = 0, contentMode: UIView.ContentMode = .scaleAspectFit) {
        super.init(image: image)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = cornerRadius
        self.contentMode = contentMode
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("initialcode:) has not been implemented")
    }
}


