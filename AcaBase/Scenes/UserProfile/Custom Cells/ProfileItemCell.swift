//
//  ProfileItemCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/9/2021.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class ProfileItemCell: UICollectionViewCell {
    
    @IBOutlet weak var largeSeparatorView: UIView!
    @IBOutlet weak var smallSeparatorView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    func setup(viewModel: ProfileCellViewModel) {
        self.largeSeparatorView.isHidden = !viewModel.hasBigSeparator
        self.smallSeparatorView.isHidden = !viewModel.hasSmallSeparator
        self.iconImageView.image = viewModel.image ?? UIImage(named: "image-not-found")
        self.titleLbl.text = viewModel.title ?? ""
    }
}
