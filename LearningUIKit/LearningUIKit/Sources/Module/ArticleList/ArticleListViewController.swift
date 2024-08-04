//
//  ArticleListViewController.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/22.
//

import Combine
import UIKit

struct ArticleListSectionModel: Hashable {
    let title: String
}

struct ArticleListItemModel: Hashable {
    let article: Article
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(article)
    }
    
    static func == (lhs: ArticleListItemModel, rhs: ArticleListItemModel) -> Bool {
        lhs.article == rhs.article
    }
}

final class ArticleListViewController: UIViewController {
    private typealias SnapShot = NSDiffableDataSourceSnapshot<ArticleListSectionModel, ArticleListItemModel>
    private typealias DataSource = UITableViewDiffableDataSource<ArticleListSectionModel, ArticleListItemModel>

    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var dataSource: DataSource! // lazy にしないの？
    private var cancellable: Set<AnyCancellable> = .init()
    
    var viewModel: ArticleListViewModelInterface!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Article List"
        
        setTableView()
    }
    
    private func setTableView() {
        dataSource = .init(tableView: tableView, cellProvider: { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ArticleTableViewCell.reuseIdentifier,
                for: indexPath
            ) as! ArticleTableViewCell
            cell.apply(presentationModel: .init(title: item.article.title))
            cell.separatorInset = .zero
            return cell
        })
        
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.reuseIdentifier)
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        bind()
    }
    
    private func bind() {
        viewModel.output.articles
            .receive(on: DispatchQueue.main)
            .sink { [weak self] articles in
                guard let self else { return }
                var snapShot = SnapShot()
                articles.forEach { arg in
                    let (section, items) = arg
                    snapShot.appendSections([section])
                    snapShot.appendItems(items, toSection: section)
                }
                dataSource.apply(snapShot)
            }
            .store(in: &cancellable)
    }
}

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: SectionHeaderView.reuseIdentifier
        ) as? SectionHeaderView ?? SectionHeaderView(reuseIdentifier: SectionHeaderView.reuseIdentifier)
        let snapshot = dataSource.snapshot()
        guard let section = snapshot.sectionIdentifiers[safe: section] else { return nil }
        headerView.apply(model: .init(text: section.title))
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        // estimate値はFigmaの高さ
        return 36
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // estimate値はFigmaの高さ
        return 92
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        viewModel.input.tappedArticle.send(item.article.id)
    }
}
