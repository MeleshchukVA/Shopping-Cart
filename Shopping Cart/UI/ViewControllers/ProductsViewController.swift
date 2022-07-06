//
//  ProductsViewController.swift
//  Shopping Cart
//
//  Created by Владимир Мелещук on 04.07.2022.
//

import UIKit

let products = [
    Product(productImage: "placeholder", productName: "Product name 1"),
    Product(productImage: "placeholder", productName: "Product name 2"),
    Product(productImage: "placeholder", productName: "Product name 3"),
    Product(productImage: "placeholder", productName: "Product name 4"),
    Product(productImage: "placeholder", productName: "Product name 5"),
    Product(productImage: "placeholder", productName: "Product name 6"),
    Product(productImage: "placeholder", productName: "Product name 7"),
    Product(productImage: "placeholder", productName: "Product name 8"),
    Product(productImage: "placeholder", productName: "Product name 9"),
    Product(productImage: "placeholder", productName: "Product name 10"),
]

final class ProductsViewController: UIViewController {
    
    // MARK: - Properties
    
    enum Section { case main }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Product>!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureCartBarButtonItem()
        configureCollectionView()
        configureDataSource()
    }
    
    // MARK: - Private methods
    
    // MARK: View, BarButtonItem
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
    
    // MARK: CollectionView, Layout
    private func configureCollectionView() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: createThreeColumnFlowLayout(in: view)
        )
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(
            ProductCollectionViewCell.self,
            forCellWithReuseIdentifier: ProductCollectionViewCell.reuseID
        )
    }
    
    private func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 6
        let minimumItemSpacing: CGFloat = 5
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 2 // Количество столбцов.

        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.sectionInset = UIEdgeInsets(
            top: padding, // Расстояние над первыми двумя ячейками.
            left: padding, // Расстояние слева от всех ячеек.
            bottom: padding, // Расстояние под последними ячейками.
            right: padding) // Расстояние справа от всех ячеек.
        
        flowLayout.itemSize = CGSize(
            width: itemWidth, // Расстояние между ячейками по оси X.
            height: itemWidth + 90 //Расстояние между ячейками по оси Y.
        )

        return flowLayout
    }
    
    // MARK: DataSource, Snapshot
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Product>(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, product) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductCollectionViewCell.reuseID,
                for: indexPath
            ) as! ProductCollectionViewCell
            cell.setupCell(product: product)
            return cell
        })
        
        configureSnapshot()
    }
    
    private func configureSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Product>()
        snapshot.appendSections([.main])
        snapshot.appendItems(products)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    // MARK: - Actions
    
    @objc func cartButtonTapped() {
        
    }
}
