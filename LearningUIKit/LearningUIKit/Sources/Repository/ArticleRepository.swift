//
//  ArticleRepository.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/22.
//

import Foundation

protocol ArticleRepositoryInterface {
    func fetchArticles() async throws -> [Article]
}

class ArticleRepository: ArticleRepositoryInterface {
    func fetchArticles() async throws -> [Article] {
        return [
            Article(title: "Article1"),
            Article(title: "Article2"),
            Article(title: "Article3"),
            Article(title: "Article4"),
            Article(title: "Article5"),
        ]
    }
}
