//
//  UIView+Extension.swift
//  Shopping Cart
//
//  Created by Владимир Мелещук on 05.07.2022.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
