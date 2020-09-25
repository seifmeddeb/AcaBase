//
//  MainTabbarViewController.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/24/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let items = tabBar.items {
            // Setting the title text color of all tab bar items:
            for item in items {
                item.setTitleTextAttributes([.foregroundColor: primaryBlue], for: .selected)
                item.setTitleTextAttributes([.foregroundColor: primaryGrey], for: .normal)
            }
        }
    }
}
