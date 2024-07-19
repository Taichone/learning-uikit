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

    func root() -> UIViewController {
        let viewController = RootViewController()
        return viewController
    }

    // MARK: viewModel を DI した UIViewController を返すメソッド
}
