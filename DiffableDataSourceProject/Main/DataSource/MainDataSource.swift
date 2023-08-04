//
//  MainDataSource.swift
//  DiffableDataSourceProject
//
//  Created by ADyatkov on 04.08.2023.
//

import Combine
import UIKit

final class MainDataSource: UITableViewDiffableDataSource<MainSection, MainItem> {

    // MARK: - Init/Deinit
    init(tableView: UITableView) {
        super.init(tableView: tableView) { tableView, indexPath, item in
            switch item {
            case .setting(let model):
                let cell = tableView.reuse(SettingCollectionViewCell.self, indexPath)
                cell?.configure(model: model)
                return cell
            case .exit:
                let cell = tableView.reuse(ExitCollectionViewCell.self, indexPath)
                return cell
            case .profile(let model):
                let cell = tableView.reuse(ProfileCollectionViewCell.self, indexPath)
                cell?.configure(model: model)
                return cell
            }
        }
    }

}

