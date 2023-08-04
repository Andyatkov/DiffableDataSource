//
//  ProfileCollectionViewCell.swift
//  DiffableDataSourceProject
//
//  Created by ADyatkov on 04.08.2023.
//

import UIKit

class ProfileCollectionViewCell: UITableViewCell {

    // MARK: - Subviews
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 64
        return imageView
    }()

    // MARK: - Init/Deinit
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
        addSubviews()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    private func configure() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }

    private func addSubviews() {
        contentView.addSubview(profileImageView)
    }

    private func layout() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 128),
            profileImageView.widthAnchor.constraint(equalToConstant: 128),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }

    // MARK: - Public methods
    func configure(model: UIImage) {
        self.profileImageView.image = model
    }

}
