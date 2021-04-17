//
//  DetailShopTextCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/15/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class DetailShopTextCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setCell(viewModel: OfferViewModel, hasTitle: Bool) {
        if hasTitle {
            titleLbl.text = viewModel.model.title
        }
        titleLbl.isHidden = !hasTitle
        descLbl.text = viewModel.model.desc
    }
}
