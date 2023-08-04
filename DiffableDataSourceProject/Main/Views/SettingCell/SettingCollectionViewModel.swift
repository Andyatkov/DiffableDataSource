//
//  SettingCollectionViewModel.swift
//  DiffableDataSourceProject
//
//  Created by ADyatkov on 04.08.2023.
//

import UIKit

class SettingCollectionViewModel {
    let id = UUID()
    let title: String
    let image: UIImage
    var isHugeFont: Bool

    init(title: String, image: UIImage, isHugeFont: Bool = false) {
        self.title = title
        self.image = image
        self.isHugeFont = isHugeFont
    }
}

// MARK: - Hashable
extension SettingCollectionViewModel: Hashable, Equatable {

    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }

    static func == (lhs: SettingCollectionViewModel, rhs: SettingCollectionViewModel) -> Bool {
      lhs.id == rhs.id
    }

}
