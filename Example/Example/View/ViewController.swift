//
//  ViewController.swift
//  Example
//
//  Created by Ugur Bozkurt on 02/05/2024.
//

import UIKit
import AnyLayout

class ViewController: CollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "AnyLayout"
        collectionView.delegate = self
        loadData()
    }

    private func loadData() {
        var snap = NSDiffableDataSourceSnapshot<AnySection, AnyItem>()
        Mock.data.forEach { data in
            snap.appendSections([data.section.eraseToAnySection])
            snap.appendItems(data.items.map(\.eraseToAnyItem))
        }
        dataSource.apply(snap)
    }

//    MARK: - Overrides

    override func registerCells(for collectionView: UICollectionView) {
        collectionView.register(cell: ImageCell.self, item: ImageItem.self)
        collectionView.register(cell: TextCell.self, item: TextItem.self)
    }

    override func registerDecorationItems(for layout: UICollectionViewLayout) {
        layout.register(BackgroundView.self, forDecorationViewOfKind: BackgroundView.elementKind)
    }
}

//MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    /// Update decoration view
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        guard let view = view as? BackgroundView else { return }
        let color = indexPath.section % 2 == 0 ? UIColor.systemIndigo : .systemPurple
        view.configure(with: BackgroundView.Model(backgroundColor: color))
    }
}

