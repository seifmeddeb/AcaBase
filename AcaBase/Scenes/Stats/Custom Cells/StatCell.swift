//
//  StatCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 29/9/2021.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class StatCell: UICollectionViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    func setup(viewModel: StatViewModel) {
        numberLbl.text = "\(viewModel.value)"
        titleLbl.text = viewModel.title ?? ""
        logoImageView.image = viewModel.image ?? UIImage(named: "image-not-found")
    }
}
