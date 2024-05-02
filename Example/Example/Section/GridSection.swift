//
//  GridSection.swift
//  Example
//
//  Created by Ugur Bozkurt on 19/11/2022.
//

import UIKit
import AnyLayout

struct GridSection: SectionProviding {
    let id = UUID()

    func layout(_ sectionIndex: Int, _ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/3),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(1.0/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .flexible(8)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8)
        let kind = BackgroundView.elementKind
        let decorationItem = NSCollectionLayoutDecorationItem.background(elementKind: kind)
        section.decorationItems = [decorationItem]
        return section
    }
}
