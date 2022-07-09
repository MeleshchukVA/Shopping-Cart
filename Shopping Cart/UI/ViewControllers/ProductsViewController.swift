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
        configureCollectionView()
        configureDataSource()
    }
    
    // MARK: - Private methods
    
    // MARK: View
    private func configureView() {
        title = Strings.products
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: CollectionView
    private func configureCollectionView() {
        collectionView = UICollectionView(
            frame: view.bounds,
            collectionViewLayout: createTwoColumnFlowLayout(in: view)
        )
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemGray6
        collectionView.register(
            ProductCollectionViewCell.self,
            forCellWithReuseIdentifier: ProductCollectionViewCell.reuseID
        )
    }
    
    // MARK: FlowLayout
    private func createTwoColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width // Ширина всего экрана.
        let padding: CGFloat = 12 // Расстояние вокруг ячеек (UIEdgeInsets).
        let minimumItemSpacing: CGFloat = 12 // Минимальное расстояние между ячейками.
        // padding * 2, где 2 - расстояние слева и справа экрана.
        /* minimumItemSpacing * 1, где 1 - количество расстояний между стобцами
        /  2 столбца - 1 такое расстояние, 3 столбца - 2, 4 столбца - 3 и т.д. */
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 1)
        // Ширина одной ячейки равна доступной ширине, поделенной на количество стобцов.
        let itemWidth = availableWidth / 2

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(
            top: padding, // Расстояние над верхними ячейками.
            left: padding, // Расстояние слева от всех ячеек.
            bottom: padding, // Расстояние под нижними ячейками.
            right: padding // Расстояние справа от всех ячеек.
        )
        flowLayout.itemSize = CGSize(
            width: itemWidth, // Ширина ячейки.
            height: itemWidth + 200 // Высота ячейки.
        )

        return flowLayout
    }
    
    // MARK: DataSource
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
    
    // MARK: Snapshot
    private func configureSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Product>()
        snapshot.appendSections([.main])
        snapshot.appendItems(products)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
}
