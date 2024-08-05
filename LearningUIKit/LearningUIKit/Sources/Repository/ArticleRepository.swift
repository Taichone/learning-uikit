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
            .init(id: .init(rawValue: UUID().uuidString), title: "究極の Swift", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "Kotlin Multiplatform 入門", category: .kotlin),
            .init(id: .init(rawValue: UUID().uuidString), title: "Swift Concurrency と Combine", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "FastAPI を試してみた", category: .python),
            .init(id: .init(rawValue: UUID().uuidString), title: "TCA のすすめ", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "究極の Kotlin", category: .kotlin),
            .init(id: .init(rawValue: UUID().uuidString), title: "Python による自然言語処理", category: .python),
            .init(id: .init(rawValue: UUID().uuidString), title: "Next.js を極める", category: .typeScript),
            .init(id: .init(rawValue: UUID().uuidString), title: "Layout プロトコル入門", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "はじめからの SwiftData", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "Redux の基本", category: .typeScript),
            .init(id: .init(rawValue: UUID().uuidString), title: "Python による機械学習", category: .python),
            .init(id: .init(rawValue: UUID().uuidString), title: "やさしい React", category: .typeScript),
        ]
    }
}
