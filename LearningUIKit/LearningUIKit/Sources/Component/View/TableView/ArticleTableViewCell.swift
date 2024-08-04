//
//  ArticleTableViewCell.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/24.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    struct PresentationModel {
        let title: String?
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    func apply(presentationModel: PresentationModel) {
        titleLabel.text = presentationModel.title
    }
}

extension ArticleTableViewCell {
    static var reuseIdentifier: String {
        return "ArticleTableViewCell"
    }
}
