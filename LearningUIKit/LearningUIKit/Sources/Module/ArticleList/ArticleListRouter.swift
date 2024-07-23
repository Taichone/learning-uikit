//
//  ArticleListRouter.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/22.
//

import UIKit

enum ArticleListDestination {
    case articleDetail // (ArticleID)
    case setting
}

@MainActor
protocol ArticleListRouterInterface {
    func navigate(to destination: ArticleListDestination)
}

final class ArticleListRouter: BaseRouter, ArticleListRouterInterface {
    func navigate(to destination: ArticleListDestination) {
        let articleDetailViewController = UIViewController()
        let settingViewController = UIViewController()

        switch destination {
        case .articleDetail:
            push(articleDetailViewController)
        case .setting:
            presentNavigation(settingViewController)
        }
    }
}
