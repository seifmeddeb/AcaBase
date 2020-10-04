//
//  UINavigationController+Helpers.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/13/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func setHomePageNavBar(for navigationItem: UINavigationItem, titleViewOpacity: CGFloat? = nil){
        
        let homeViewController = self as! HomeViewController
        let button =  UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 130, height: 34)
        button.backgroundColor = primaryBlue
        button.titleEdgeInsets.left = 10
        button.titleEdgeInsets.right = 10
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        button.setTitle("Poser une question", for: .normal)
        button.cornerRadius = 17
        if let alpha = titleViewOpacity {
            button.alpha = alpha
        }
        button.addTarget(self, action: #selector(homeViewController.clickTitleButton), for: .touchUpInside)
        navigationItem.titleView = button
        
        let rightButton =  UIButton(type: .custom)
        rightButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        rightButton.setImage(UIImage(named: "notif"), for: .normal)
        rightButton.contentMode = .scaleAspectFit
        rightButton.addTarget(self, action: #selector(homeViewController.clickRightButton), for: .touchUpInside)
        let rightBarItem = UIBarButtonItem(customView: rightButton)
        let currWidth = rightBarItem.customView?.widthAnchor.constraint(equalToConstant: 20)
        currWidth?.isActive = true
        let currHeight = rightBarItem.customView?.heightAnchor.constraint(equalToConstant: 20)
        currHeight?.isActive = true
        navigationItem.rightBarButtonItem = rightBarItem
        
        let leftButton =  UIButton(type: .custom)
        leftButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        leftButton.setImage(UIImage(named: "user"), for: .normal)
        leftButton.contentMode = .scaleAspectFit
        leftButton.addTarget(self, action: #selector(homeViewController.clickLeftButton), for: .touchUpInside)
        let lefttBarItem = UIBarButtonItem(customView: leftButton)
        let leftWidth = lefttBarItem.customView?.widthAnchor.constraint(equalToConstant: 20)
        leftWidth?.isActive = true
        let leftHeight = lefttBarItem.customView?.heightAnchor.constraint(equalToConstant: 20)
        leftHeight?.isActive = true
        navigationItem.leftBarButtonItem = lefttBarItem
    }
}
