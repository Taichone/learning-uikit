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
            .init(id: .init(rawValue: UUID().uuidString), title: "Swift Concurrency と Combine", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "優しい Kotlin", category: .kotlin),
            .init(id: .init(rawValue: UUID().uuidString), title: "はじめての Swift Concurrency", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "Python のすすめ", category: .python),
            .init(id: .init(rawValue: UUID().uuidString), title: "FastAPI を試してみた", category: .python),
            .init(id: .init(rawValue: UUID().uuidString), title: "KMP 入門", category: .kotlin),
            .init(id: .init(rawValue: UUID().uuidString), title: "TCA のすすめ", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "Python による自然言語処理", category: .python),
            .init(id: .init(rawValue: UUID().uuidString), title: "Next.js を極める", category: .typeScript),
            .init(id: .init(rawValue: UUID().uuidString), title: "Kotlin プログラミングガイド", category: .kotlin),
            .init(id: .init(rawValue: UUID().uuidString), title: "Layout プロトコル入門", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "はじめからの SwiftData", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "Redux について", category: .typeScript),
            .init(id: .init(rawValue: UUID().uuidString), title: "Swift パフォーマンス最適化", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "Kotlin で Android 開発", category: .kotlin),
            .init(id: .init(rawValue: UUID().uuidString), title: "Python による機械学習", category: .python),
            .init(id: .init(rawValue: UUID().uuidString), title: "JS と TS の比較", category: .typeScript),
            .init(id: .init(rawValue: UUID().uuidString), title: "Kotlin でのテスト自動化", category: .kotlin),
            .init(id: .init(rawValue: UUID().uuidString), title: "Python Web 開発入門", category: .python),
            .init(id: .init(rawValue: UUID().uuidString), title: "TypeScript の高度な使い方", category: .typeScript),
            .init(id: .init(rawValue: UUID().uuidString), title: "SwiftUI でのレイアウトデザイン", category: .swift),
            .init(id: .init(rawValue: UUID().uuidString), title: "Python でのスクレイピング", category: .python),
            .init(id: .init(rawValue: UUID().uuidString), title: "Kotlin の拡張関数", category: .kotlin),
            .init(id: .init(rawValue: UUID().uuidString), title: "Python の非同期処理", category: .python),
            .init(id: .init(rawValue: UUID().uuidString), title: "TypeScript のテストコード", category: .typeScript),
        ]
    }
}
