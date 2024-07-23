//
//  DependencyContainer.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/19.
//

import UIKit

protocol DependencyContainerInterface {
    var articleStoreUseCase: ArticleStoreUseCaseInterface { get }
}

final class DependencyContainer: DependencyContainerInterface {
    static let shared = DependencyContainer()

    private init() {}

    var articleStoreUseCase: ArticleStoreUseCaseInterface {
        // TODO: それぞれを DI を考慮した実装に変更する
        ArticleStoreUseCase(articleRepository: ArticleRepository())
    }
}
