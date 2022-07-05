//
//  ProductsViewController.swift
//  Shopping Cart
//
//  Created by Владимир Мелещук on 04.07.2022.
//

import UIKit

final class ProductsViewController: UIViewController {
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureCartBarButtonItem()
    }
    
    //MARK: - Private methods
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        title = "Товары"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureCartBarButtonItem() {
        let configuration = UIImage.SymbolConfiguration(pointSize: 20)
        let cartButton = UIBarButtonItem(
            image: SFSymbols.cart?.withConfiguration(configuration),
            style: .plain,
            target: self,
            action: #selector(cartButtonTapped)
        )
        navigationItem.rightBarButtonItem = cartButton
    }
    
    //MARK: - Actions
    
    @objc func cartButtonTapped() {
        
    }
}
