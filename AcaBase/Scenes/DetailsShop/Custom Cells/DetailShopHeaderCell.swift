//
//  DetailShopHeaderCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/15/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class DetailShopHeaderCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(viewModel: OfferViewModel) {
        titleLbl.text = viewModel.model.title
    }

}
