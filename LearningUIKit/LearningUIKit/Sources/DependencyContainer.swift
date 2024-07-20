//
//  DependencyContainer.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/19.
//

import UIKit

protocol DependencyContainerInterface {}

final class DependencyContainer: DependencyContainerInterface {
    static let shared = DependencyContainer()

    private init() {}
}
