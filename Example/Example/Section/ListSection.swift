//
//  ListSection.swift
//  Example
//
//  Created by Ugur Bozkurt on 19/11/2022.
//

import UIKit
import AnyLayout

struct ListSection: SectionProviding {
    let id = UUID()

    func layout(_ sectionIndex: Int, _ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let config = UICollectionLayoutListConfiguration.init(appearance: .plain)
        let section = NSCollectionLayoutSection.list(using: config, layoutEnvironment: layoutEnvironment)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8)
        section.interGroupSpacing = 8
        let kind = BackgroundView.elementKind
        let decorationItem = NSCollectionLayoutDecorationItem.background(elementKind: kind)
        section.decorationItems = [decorationItem]
        return section
    }
}
