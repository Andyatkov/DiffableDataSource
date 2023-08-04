//
//  SettingCollectionViewCell.swift
//  DiffableDataSourceProject
//
//  Created by ADyatkov on 04.08.2023.
//

import UIKit

class SettingCollectionViewCell: UITableViewCell {

    // MARK: - Subviews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(logoImageView)
    }

    private func layout() {
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logoImageView.heightAnchor.constraint(equalToConstant: 32),
            logoImageView.widthAnchor.constraint(equalToConstant: 32),
            logoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    // MARK: - Public methods
    func configure(model: SettingCollectionViewModel) {
        self.titleLabel.text = model.title
        self.titleLabel.font = .systemFont(ofSize: model.isHugeFont ? 22 : 17, weight: .medium)
        self.logoImageView.image = model.image
    }

}
