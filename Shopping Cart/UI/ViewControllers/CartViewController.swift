//
//  CartViewController.swift
//  Shopping Cart
//
//  Created by Владимир Мелещук on 04.07.2022.
//

import UIKit

final class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .systemGreen
        title = "Корзина"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
