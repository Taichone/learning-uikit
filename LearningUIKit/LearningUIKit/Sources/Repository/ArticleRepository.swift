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
            .init(id: .init(rawValue: UUID().uuidString), title: "記事1", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "記事2", category: .kotlin),
            .init(id: .init(rawValue: UUID().uuidString), title: "記事3", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "記事4", category: .python),
            .init(id: .init(rawValue: UUID().uuidString), title: "記事5", category: .typeScript),
        ]
    }
}
