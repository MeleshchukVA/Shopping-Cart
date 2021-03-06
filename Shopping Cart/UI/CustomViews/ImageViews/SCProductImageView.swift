//
//  SCProductImageView.swift
//  Shopping Cart
//
//  Created by Владимир Мелещук on 09.07.2022.
//

import UIKit

final class SCProductImageView: UIImageView {

    let placeholderImage = Images.placeholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
