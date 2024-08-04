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

extension Article.Category: Comparable {
    private var sortOrder: Int {
        switch self {
            case .swift: return 0
            case .kotlin: return 1
            case .python: return 2
            case .typeScript: return 3
        }
    }

    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.sortOrder == rhs.sortOrder
    }

    static func <(lhs: Self, rhs: Self) -> Bool {
       return lhs.sortOrder < rhs.sortOrder
    }
}
