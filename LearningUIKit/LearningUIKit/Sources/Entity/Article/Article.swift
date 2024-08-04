//
//  Article.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/22.
//

import Foundation

struct Article: Hashable {
    let id: ArticleID
    let title: String
    // let url: String
    let category: Category
}

extension Article {
    enum Category: String {
        case swift = "Swift"
        case kotlin = "Kotlin"
        case python = "Python"
        case typeScript = "TypeScript"
    }
}
