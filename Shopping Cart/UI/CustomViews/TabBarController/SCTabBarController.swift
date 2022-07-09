//
//  SCTabBarController.swift
//  Shopping Cart
//
//  Created by Владимир Мелещук on 04.07.2022.
//

import UIKit

final class SCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemBlue
        viewControllers = [
            createProductsNavigationController(),
            createCartNavigationController(),
            createProfileNavigationController()
        ]
    }

    private func createProductsNavigationController() -> UINavigationController {
        let productsViewController = ProductsViewController()
        productsViewController.tabBarItem = UITabBarItem(
            title: Strings.products,
            image: SFSymbols.gift,
            tag: 0
        )

        return UINavigationController(rootViewController: productsViewController)
    }

    private func createCartNavigationController() -> UINavigationController {
        let cartListViewController = CartViewController()
        cartListViewController.tabBarItem = UITabBarItem(
            title: Strings.cart,
            image: SFSymbols.cart,
            tag: 0
        )

        return UINavigationController(rootViewController: cartListViewController)
    }
    
    private func createProfileNavigationController() -> UINavigationController {
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(
            title: Strings.profile,
            image: SFSymbols.profile,
            tag: 0
        )

        return UINavigationController(rootViewController: profileViewController)
    }
}
