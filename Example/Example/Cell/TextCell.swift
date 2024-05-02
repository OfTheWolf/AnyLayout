//
//  TextCell.swift
//  Example
//
//  Created by Ugur Bozkurt on 26/11/2022.
//

import UIKit
import AnyLayout

final class TextCell: UICollectionViewCell {

    private lazy var textLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemYellow
        contentView.addSubview(textLabel)
        contentView.layer.cornerRadius = 8
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }

    func configure(with text: TextItem) {
        textLabel.text = text.text
    }

}

extension TextCell: Registering {
    typealias Cell = TextCell
    typealias Item = TextItem

    static var registration: UICollectionView.CellRegistration<Cell, AnyItem> = UICollectionView.CellRegistration<Cell, AnyItem> { cell, indexPath, itemIdentifier in
        let data: Item = itemIdentifier.resolve()
        cell.configure(with: data)
    }
}

extension TextCell: Dequeueing {
    static func dequeueCell(_ collectionView: UICollectionView, indexPath: IndexPath, item: AnyItem) -> UICollectionViewCell {
        return collectionView.dequeueConfiguredReusableCell(using: Self.registration, for: indexPath, item: item)
    }
}
