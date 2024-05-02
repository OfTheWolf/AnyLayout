//
//  CollectionViewController.swift
//  Example
//
//  Created by Ugur Bozkurt on 02/05/2024.
//

import UIKit

open class CollectionViewController: UIViewController {

    private lazy var layout = UICollectionViewCompositionalLayout(sectionProvider: { [weak self] index, layoutEnv in
        guard let section = self?.dataSource.sectionIdentifier(for: index) else { return nil }
        return section.layout(index, layoutEnv)
    })

    public var collectionView: UICollectionView!

    public var dataSource: UICollectionViewDiffableDataSource<AnySection, AnyItem>!

    open override func viewDidLoad() {
        super.viewDidLoad()

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        view.addSubview(collectionView)

        registerCells(for: collectionView)
        registerDecorationItems(for: layout)

        dataSource = .init(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueCell(indexPath: indexPath, item: itemIdentifier)
        }
    }

    open func registerCells(for collectionView: UICollectionView) {
        preconditionFailure("Implement registerCells(for:)")
    }

    open func registerDecorationItems(for layout: UICollectionViewLayout) {
        preconditionFailure("Implement registerDecorationItems(for:)")
    }
}

