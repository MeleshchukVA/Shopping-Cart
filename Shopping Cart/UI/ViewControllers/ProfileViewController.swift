//
//  ProfileViewController.swift
//  Shopping Cart
//
//  Created by Владимир Мелещук on 04.07.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .systemYellow
        title = Strings.profile
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
