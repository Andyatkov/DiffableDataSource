//
//  UITableView+Extensions.swift
//  DiffableDataSourceProject
//
//  Created by ADyatkov on 04.08.2023.
//

import UIKit

extension UITableView {

    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }
        return lastIndexPath == indexPath
    }

    func isLastRow(at indexPath: IndexPath) -> Bool {
        return (numberOfRows(inSection: indexPath.section) - 1) == indexPath.row
    }
}

extension UITableView {

    func register<T: UITableViewCell>(_ type: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func register<T: UITableViewHeaderFooterView>(_ type: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }

    func reuse<T: UITableViewCell>(_ type: T.Type, _ indexPath: IndexPath) -> T? {
        dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T
    }

    func reuse<T: UITableViewHeaderFooterView>(_ type: T.Type) -> T? {
        dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T
    }

}

extension UITableViewCell {

    static var reuseIdentifier: String {
        String(describing: self)
    }

    var reuseIdentifier: String {
        type(of: self).reuseIdentifier
    }

}

extension UITableViewHeaderFooterView {

    static var reuseIdentifier: String {
        String(describing: self)
    }

    var reuseIdentifier: String {
        type(of: self).reuseIdentifier
    }

}

