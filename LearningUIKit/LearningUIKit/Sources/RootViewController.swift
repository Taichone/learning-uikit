//
//  RootViewController.swift
//  LearningUIKit
//
//  Created by Taichi on 2024/07/17.
//

import UIKit

class RootViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColors.systemMint

        let label = UILabel()
        label.text = "Hello UIKit"
        label.textAlignment = .center
        label.backgroundColor = .red

        // AutoLayout を使用するために必要
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)

        // 制約の設定は addSubview の後
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 4).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width / 4).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }


}
