//
//  SCTitleLabel.swift
//  Shopping Cart
//
//  Created by Владимир Мелещук on 09.07.2022.
//

import UIKit

final class SCTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
    }

    private func configure() {
        textColor = .label
        numberOfLines = 3
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
