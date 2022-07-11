//
//  SCButton.swift
//  Shopping Cart
//
//  Created by Владимир Мелещук on 09.07.2022.
//

import UIKit

final class SCButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 22, weight: .bold, scale: .medium)
        let largePlusSymbol = UIImage(systemName: Strings.plus, withConfiguration: symbolConfiguration)
        setImage(largePlusSymbol, for: .normal)
        tintColor = .systemGreen
        layer.backgroundColor = UIColor.systemBackground.cgColor
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGreen.cgColor
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.width / 2
    }
}
