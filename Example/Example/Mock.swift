//
//  Mock.swift
//  Example
//
//  Created by Ugur Bozkurt on 02/05/2024.
//

import Foundation
import AnyLayout

struct Mock {
    let section: any SectionProviding
    let items: [any ItemProviding]
    
    static var data: [Mock] = [
        Mock(section: ListSection(), items: [
            ImageItem(imageName: "image1"),
            TextItem(text: "Text 1")
        ]),

        Mock(section: GridSection(), items: [
            ImageItem(imageName: "image2"),
            TextItem(text: "Text 5"),
            ImageItem(imageName: "image3"),
            ImageItem(imageName: "image4"),
            ImageItem(imageName: "image5")
        ]),

        Mock(section: ListSection(), items: [
            TextItem(text: "Text 2"),
            ImageItem(imageName: "image6"),
            TextItem(text: "Text 3"),
            TextItem(text: "Text 4"),
            ImageItem(imageName: "image7")
        ])
    ]
}
