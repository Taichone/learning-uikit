//
//  UIFontExtension.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/24.
//

import UIKit

extension UIFont {
    /// iOS  の Dynamic Type 機能に対応するフォント（「さらに大きな文字」の設定）
    var scaled: UIFont {
        return UIFontMetrics.default.scaledFont(for: self)
    }
}
