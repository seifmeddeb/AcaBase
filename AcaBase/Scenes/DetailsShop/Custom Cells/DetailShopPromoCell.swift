//
//  DetailShopPromoCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/15/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class DetailShopPromoCell: UITableViewCell {

    @IBOutlet weak var sessionNbrLbl: UILabel!
    @IBOutlet weak var accessLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var newPriceLbl: UILabel!
    @IBOutlet weak var oldPriceLbl: UILabel!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var oldPriceLineView: UIView!
    @IBOutlet weak var discountView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(viewModel: OfferViewModel) {
        self.accessLbl.text = viewModel.access
        self.sessionNbrLbl.text = "\(viewModel.model.nbrSessions ?? 0)"
        self.durationLbl.text = viewModel.model.duration
        self.newPriceLbl.text = "\(viewModel.model.newPrice)€"
        self.discountLbl.text = "\(viewModel.model.percentagePromo ?? 0)%"
        self.discountView.isHidden = false
        
        if viewModel.model.percentagePromo ?? 0 == 0 {
            self.discountView.isHidden = true
        }
        
        if let price = viewModel.model.oldPrice {
            self.oldPriceLbl.text = "\(price)€"
            oldPriceLineView.isHidden = false
            oldPriceLbl.isHidden = false
        } else {
            oldPriceLineView.isHidden = true
            oldPriceLbl.isHidden = true
        }
    }

}
