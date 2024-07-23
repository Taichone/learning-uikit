//
//  SettingViewController.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/22.
//

import UIKit

final class SettingViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Setting"
    }
}
