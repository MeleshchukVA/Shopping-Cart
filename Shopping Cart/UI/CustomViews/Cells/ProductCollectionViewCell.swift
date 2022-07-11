//
//  ProductCollectionViewCell.swift
//  Shopping Cart
//
//  Created by Владимир Мелещук on 04.07.2022.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "ProductCell"
    
    let cellContainerStackView = UIStackView()
    let cellBottomVerticalStackView = UIStackView()
    let cellPriceAndAddButtonHorizontalStackView = UIStackView()
    
    let imageViewContainer = SCCellView(frame: .zero)
    let productNameView = SCCellView(frame: .zero)
    let priceView = SCCellView(frame: .zero)
    let addButtonView = SCCellView(frame: .zero)
    
    let productImageView = SCProductImageView(frame: .zero)
    let productNameLabel = SCTitleLabel(textAlignment: .left, fontSize: 20)
    let priceLabel = SCTitleLabel(textAlignment: .left, fontSize: 22)
    let addButton = SCButton(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCellContainerStackView()
        configureCellVerticalBottomStackView()
        configureCellPriceAndAddButtonHorizontalStackView()
        configureCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(product: Product) {
        productImageView.image = Images.placeholder
        productNameLabel.text = product.productName
        priceLabel.text = product.price
    }
    
    private func configureCellContainerStackView() {
        cellContainerStackView.axis = .vertical
        cellContainerStackView.distribution = .fillEqually
        cellContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        cellContainerStackView.addArrangedSubview(imageViewContainer)
        cellContainerStackView.addArrangedSubview(cellBottomVerticalStackView)
    }
    
    private func configureCellVerticalBottomStackView() {
        cellBottomVerticalStackView.axis = .vertical
        cellBottomVerticalStackView.distribution = .fillEqually
        cellBottomVerticalStackView.spacing = 15
        cellBottomVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        cellBottomVerticalStackView.addArrangedSubview(productNameView)
        cellBottomVerticalStackView.addArrangedSubview(cellPriceAndAddButtonHorizontalStackView)
    }
    
    private func configureCellPriceAndAddButtonHorizontalStackView() {
        cellPriceAndAddButtonHorizontalStackView.axis = .horizontal
        cellPriceAndAddButtonHorizontalStackView.distribution = .fillEqually
        cellPriceAndAddButtonHorizontalStackView.spacing = 30
        cellPriceAndAddButtonHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        cellPriceAndAddButtonHorizontalStackView.addArrangedSubview(priceView)
        cellPriceAndAddButtonHorizontalStackView.addArrangedSubview(addButtonView)
    }

    private func configureCell() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 10
        
        addSubview(cellContainerStackView)
        
        cellContainerStackView.addSubviews(
            imageViewContainer,
            cellBottomVerticalStackView
        )
                
        imageViewContainer.addSubview(productImageView)
        productNameView.addSubview(productNameLabel)
        priceView.addSubview(priceLabel)
        addButtonView.addSubview(addButton)

                
        let padding: CGFloat = 18

        NSLayoutConstraint.activate([
            cellContainerStackView.topAnchor.constraint(equalTo: topAnchor),
            cellContainerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellContainerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellContainerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            productImageView.centerXAnchor.constraint(equalTo: imageViewContainer.centerXAnchor),
            productImageView.centerYAnchor.constraint(equalTo: imageViewContainer.centerYAnchor),
            productImageView.widthAnchor.constraint(equalTo: imageViewContainer.widthAnchor, constant: -padding),
            productImageView.heightAnchor.constraint(equalTo: imageViewContainer.heightAnchor, constant: -padding),
            
            productNameLabel.centerXAnchor.constraint(equalTo: productNameView.centerXAnchor),
            productNameLabel.centerYAnchor.constraint(equalTo: productNameView.centerYAnchor),
            productNameLabel.widthAnchor.constraint(equalTo: productNameView.widthAnchor, constant: -padding),
            productNameLabel.heightAnchor.constraint(equalTo: productNameView.heightAnchor, constant: -padding),
            
            priceLabel.centerXAnchor.constraint(equalTo: priceView.centerXAnchor),
            priceLabel.centerYAnchor.constraint(equalTo: priceView.centerYAnchor),
            priceLabel.widthAnchor.constraint(equalTo: priceView.widthAnchor, constant: -padding),
            priceLabel.heightAnchor.constraint(equalTo: priceView.heightAnchor, constant: -padding),
            
            addButton.centerXAnchor.constraint(equalTo: addButtonView.centerXAnchor),
            addButton.centerYAnchor.constraint(equalTo: addButtonView.centerYAnchor),
            addButton.widthAnchor.constraint(equalTo: addButtonView.widthAnchor, constant: -padding),
            addButton.heightAnchor.constraint(equalTo: addButtonView.widthAnchor, constant: -padding),
        ])
    }
}
