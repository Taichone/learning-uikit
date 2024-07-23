//
//  DependencyViewBuilder.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/19.
//

import UIKit

final class DependencyViewBuilder {
    static let shared = DependencyViewBuilder(container: DependencyContainer.shared)

    private let container: DependencyContainerInterface

    init(container: DependencyContainerInterface) {
        self.container = container
    }

    // MARK: viewModel を DI した UIViewController を返すメソッド

    func articleList() -> UIViewController {
        let viewController = ArticleListViewController()
        let viewModel = ArticleListViewModel(
            input: .init(),
            state: .init(),
            dependency: .init(
                router: ArticleListRouter(moduleViewController: viewController),
                articleStoreUseCase: container.articleStoreUseCase
            )
        )
        viewController.viewModel = viewModel

        return viewController
    }
}
