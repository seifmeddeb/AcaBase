//
//  ImageCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 11/2/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var deleteBtn: UIButton!
    // Properties
    private var didPressDelete: (() ->Void)?
    
    func set(image: UIImage){
        self.imageView.image = image
    }
    
    @discardableResult
    func didPressDelete(_ completion: (()->Void)?) ->Self {
        self.didPressDelete = completion
        return self
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        didPressDelete?()
    }
}
