//
//  NotFoundView.swift
//  Movies
//
//  Created by Juan Esteban Rozo Mendez on 29/10/24.
//

import UIKit
import SwiftUI

class NotFoundView: UIView {
    private lazy var warningLogo = ImageCustom()
    lazy var messageStack = StackCustom(axis: .vertical, aligment: .center, distribution: .fill, spacing: 20)
    lazy var message1 = CustomLabel()
    lazy var message2 = CustomLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Initial code:) has not been implemented")
    }
}

extension NotFoundView {
    private func style() {
        message1.text = "No se encontraron resultados para la busqueda de: "
        message1.textAlignment = .center
        message1.font = .italicSystemFont(ofSize: 20)
        message2.textAlignment = .center
        message2.font = .italicSystemFont(ofSize: 20)
        warningLogo.image = .init(systemName: "exclamationmark.triangle")
    }
    private func layout() {
        messageStack.addSubViews([warningLogo, message1, message2])
        addSubview(messageStack)
        NSLayoutConstraint.activate([
            warningLogo.heightAnchor.constraint(equalToConstant: 90),
            warningLogo.widthAnchor.constraint(equalToConstant: 90),
            messageStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageStack.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            messageStack.trailingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.trailingAnchor, multiplier: -1),
        ])
    }
}

struct NotFoundViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> NotFoundView {
        let view = NotFoundView()
        return view
    }
    
    func updateUIView(_ uiView: NotFoundView, context: Context) {
        
    }
}

struct NotFoundViewPreview: PreviewProvider {
    static var previews: some View { NotFoundViewRepresentable() }
}
