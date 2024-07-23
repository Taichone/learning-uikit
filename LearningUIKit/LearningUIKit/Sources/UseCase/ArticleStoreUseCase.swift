//
//  ArticleStoreUseCase.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/22.
//

import Foundation

protocol ArticleStoreUseCaseInterface {
    func fetchArticles() async throws -> [Article]
}

class ArticleStoreUseCase: ArticleStoreUseCaseInterface {
    private let articleRepository: ArticleRepositoryInterface

    init(articleRepository: ArticleRepositoryInterface) {
        self.articleRepository = articleRepository
    }

    func fetchArticles() async throws -> [Article] {
        try await self.articleRepository.fetchArticles()
    }
}
