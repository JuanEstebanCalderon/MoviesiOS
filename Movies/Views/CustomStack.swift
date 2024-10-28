//
//  StackCustom.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 26/10/24.
//

import UIKit

class CustomStack: UIStackView {
    func addSubViews(_ views: [UIView]) {
        views.forEach {
            self.addArrangedSubview( $0 )
        }
    }
    
    init(axis: NSLayoutConstraint.Axis = .vertical,
         aligment: UIStackView.Alignment = .fill,
         distribution: UIStackView.Distribution = .fill,
         spacing: CGFloat = UIStackView.spacingUseDefault){
        super.init(frame: .zero)
        self.axis = axis
        self.alignment = aligment
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
        self.spacing = spacing
    }
    
    required init(coder: NSCoder) {
        fatalError("initialcode:) has not been implemented")
    }
}
