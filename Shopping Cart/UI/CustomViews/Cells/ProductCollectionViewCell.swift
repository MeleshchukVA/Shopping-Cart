//
//  ProductCollectionViewCell.swift
//  Shopping Cart
//
//  Created by Владимир Мелещук on 04.07.2022.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "ProductCell"
    
    let productImageView = ProductImageView(frame: .zero)
    let productLabel = SCSecondaryTitleLabel(fontSize: 20)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(product: Product) {
        productImageView.image = Images.placeholder
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 10
    }

    private func configure() {
        addSubviews(productImageView)

        let padding: CGFloat = 6

        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            productImageView.heightAnchor.constraint(equalToConstant: 140),
        ])
    }
}
