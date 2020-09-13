//
//  TopicCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/13/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class TopicCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    
    func set(viewModel: TopicDAO) {
        titleLbl.text = viewModel.title
        descLbl.text = "chapter 1 FIX ME"
        imageView.setImageAsync(url: URL(string: viewModel.icon ?? ""))
    }
}
