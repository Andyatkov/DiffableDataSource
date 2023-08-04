//
//  MainItem.swift
//  DiffableDataSourceProject
//
//  Created by ADyatkov on 04.08.2023.
//

import UIKit

enum MainItem: Hashable {
    case profile(model: UIImage)
    case setting(model: SettingCollectionViewModel)
    case exit
}
