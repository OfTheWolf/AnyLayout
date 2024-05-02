//
//  ImageCell.swift
//  Example
//
//  Created by Ugur Bozkurt on 26/11/2022.
//

import UIKit
import AnyLayout

final class ImageCell: UICollectionViewListCell {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 8
        view.layer.cornerCurve = .continuous
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundConfiguration = .clear()
        contentView.addSubview(imageView)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    func configure(with image: ImageItem) {
        imageView.image = UIImage(named: image.imageName)
    }
}

extension ImageCell: Registering {
    typealias Cell = ImageCell
    typealias Item = ImageItem

    static var registration: UICollectionView.CellRegistration<Cell, AnyItem> = UICollectionView.CellRegistration<Cell, AnyItem> { cell, indexPath, itemIdentifier in
        let data: Item = itemIdentifier.resolve()
        cell.configure(with: data)
    }
}

extension ImageCell: Dequeueing {
    static func dequeueCell(_ collectionView: UICollectionView, indexPath: IndexPath, item: AnyItem) -> UICollectionViewCell {
        return collectionView.dequeueConfiguredReusableCell(using: Self.registration, for: indexPath, item: item)
    }
}
