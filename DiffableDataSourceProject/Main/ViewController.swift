//
//  ViewController.swift
//  DiffableDataSourceProject
//
//  Created by ADyatkov on 04.08.2023.
//

import UIKit

class ViewController: UIViewController {

    typealias MainSnapshot = NSDiffableDataSourceSnapshot<MainSection, MainItem>

    // MARK: - Properties
    private lazy var dataSource: MainDataSource = {
        let dataSource = MainDataSource(tableView: tableView)
        return dataSource
    }()
    private var isHugeFont: Bool = false
    private var snapshot = MainSnapshot()

    // MARK: - Subviews
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingCollectionViewCell.self)
        tableView.register(ExitCollectionViewCell.self)
        tableView.register(ProfileCollectionViewCell.self)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = 64
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private lazy var refreshButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(
            image: UIImage(named: "refresh")!,
            style: .plain,
            target: self,
            action: #selector(didSelectRefresh)
        )
        return barButtonItem
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        configure()
    }

    // MARK: - Private methods
    private func configure() {
        navigationItem.title = "PROFILE"
        navigationItem.rightBarButtonItem = refreshButton

        snapshot = MainSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(
            [
                .profile(model: UIImage(named: "boy")!),
                .setting(model: SettingCollectionViewModel(title: "Title", image: UIImage(named: "profile")!)),
                .setting(model: SettingCollectionViewModel(title: "Title 2", image: UIImage(named: "clock")!)),
                .setting(model: SettingCollectionViewModel(title: "Title 3", image: UIImage(named: "scissors")!)),
                .setting(model: SettingCollectionViewModel(title: "Title 4", image: UIImage(named: "setting")!)),
                .exit
            ],
            toSection: .main
        )

        dataSource.apply(snapshot, animatingDifferences: false)
    }

    @objc private func didSelectRefresh() {
        isHugeFont.toggle()
        
        let items = snapshot.itemIdentifiers
        var itemsReload = [MainItem]()
        for item in items {
            switch item {
            case .setting(let model):
                model.isHugeFont = isHugeFont
                itemsReload.append(item)
            default:
                break
            }
        }
        snapshot.reconfigureItems(itemsReload)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = snapshot.itemIdentifiers[indexPath.item]
        switch item {
        case .profile:
            return 164
        case .setting, .exit:
            return 64
        }
    }
}

