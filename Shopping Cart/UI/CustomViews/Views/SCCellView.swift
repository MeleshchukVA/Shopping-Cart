//
//  SCCellView.swift
//  Shopping Cart
//
//  Created by Владимир Мелещук on 09.07.2022.
//

import UIKit

final class SCCellView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
       backgroundColor = .clear
       translatesAutoresizingMaskIntoConstraints = false
    }
}
