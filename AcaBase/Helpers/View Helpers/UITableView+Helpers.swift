//
//  UITableView+Helpers.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 11/28/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    @discardableResult
    func register<T: UITableViewCell>(_ cellClass: T.Type) ->Self {
        guard let name = NSStringFromClass(cellClass)
            .components(separatedBy: ".").last else {
            fatalError("Unknown Class Name")
        }
        let nib = UINib(nibName: name, bundle: Bundle(for: T.self))
        self.register(nib, forCellReuseIdentifier: name)
        return self
    }
    
    @discardableResult
    func register<T: UITableViewHeaderFooterView>(_ cellClass: T.Type) ->Self {
        guard let name = NSStringFromClass(cellClass)
            .components(separatedBy: ".").last else {
            fatalError("Unknown Class Name")
        }
        let nib = UINib(nibName: name, bundle: Bundle(for: T.self))
        self.register(nib, forHeaderFooterViewReuseIdentifier: name)
        return self
    }
    
}
extension UICollectionView {
    @discardableResult
    func register<T: UICollectionViewCell>(_ cellClass: T.Type) ->Self {
        guard let name = NSStringFromClass(cellClass)
            .components(separatedBy: ".").last else {
            fatalError("Unknown Class Name")
        }
        let nib = UINib(nibName: name, bundle: Bundle(for: T.self))
        self.register(nib, forCellWithReuseIdentifier: name)
        return self
    }
}
