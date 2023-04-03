//
//  ViewController.swift
//  ThemeSwitcher
//
//  Created by Administrator on 4/3/23.
//

import UIKit

class ChildViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print(previousTraitCollection?.userInterfaceStyle.rawValue ?? 0)
    }
}

