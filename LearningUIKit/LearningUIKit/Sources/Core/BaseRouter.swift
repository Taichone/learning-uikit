//
//  BaseRouter.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/20.
//

import UIKit

/// 画面のモーダルやナビゲーション処理を共通化するためのクラス
class BaseRouter {
    weak var moduleViewController: UIViewController?

    init(moduleViewController: UIViewController) {
        self.moduleViewController = moduleViewController
    }

    @MainActor
    func presentNavigation(_ targetViewController: UIViewController, completion: (() -> Void)? = nil) {
        let viewController = UINavigationController(rootViewController: targetViewController)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical
        self.moduleViewController?.present(viewController, animated: true, completion: completion)
    }

    @MainActor
    func present(_ targetViewController: UIViewController, completion:(() -> Void)? = nil) {
        self.moduleViewController?.present(targetViewController, animated: true, completion: completion)
    }

    @MainActor
    func push(_ targetViewController: UIViewController) {
        guard let navigationController = self.moduleViewController?.navigationController else {
            assertionFailure("NavigationController is not set.")
            return
        }
        navigationController.pushViewController(targetViewController, animated: true)
    }

    @MainActor
    func dismiss() {
        self.moduleViewController?.dismiss(animated: true)
    }

    @MainActor
    func pop() {
        guard let navigationController = self.moduleViewController?.navigationController else {
            self.dismiss()
            return
        }
        navigationController.popViewController(animated: true)
    }
}
