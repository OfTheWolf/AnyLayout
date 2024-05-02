//
//  BackgroundView.swift
//  Example
//
//  Created by Ugur Bozkurt on 02/05/2024.
//

import UIKit

final class BackgroundView: UICollectionReusableView {
    static let elementKind = String(reflecting: BackgroundView.self)

    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: Model) {
        contentView.backgroundColor = model.backgroundColor
    }

    struct Model {
        let backgroundColor: UIColor?
    }
}
