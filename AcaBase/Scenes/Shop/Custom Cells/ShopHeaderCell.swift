//
//  ShopHeaderCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/10/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class ShopHeaderCell: UICollectionViewCell {
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var discountLbl: UILabel!
    @IBOutlet weak var newPriceLbl: UILabel!
    @IBOutlet weak var oldPriceLbl: UILabel!
    @IBOutlet weak var nbrSessionsLbl: UILabel!
    @IBOutlet weak var featuresLbl: UILabel!
    @IBOutlet weak var oldPriceLineView: UIView!
    @IBOutlet weak var offerView: UIView!
    @IBOutlet weak var discountView: UIView!
    
    
    func setCell(viewModel: OfferViewModel) {
        self.bgImageView.setImageAsync(url: viewModel.imageUrl)
        self.offerView.clipsToBounds = true
        self.offerView.layer.cornerRadius = 10
        self.offerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.featuresLbl.text = viewModel.access
        self.nbrSessionsLbl.text = "\(viewModel.model.nbrSessions ?? 0)"
        self.durationLbl.text = viewModel.model.duration
        self.newPriceLbl.text = viewModel.model.newPrice
        self.discountLbl.text = "-\(viewModel.model.percentagePromo ?? 0)%"
        self.discountView.isHidden = false
        
        if viewModel.model.percentagePromo ?? 0 == 0 {
            self.discountView.isHidden = true
        }
        
        if let price = viewModel.model.oldPrice {
            self.oldPriceLbl.text = "\(price)"
            oldPriceLineView.isHidden = false
            newPriceLbl.isHidden = false
        } else {
            oldPriceLineView.isHidden = true
            newPriceLbl.isHidden = true
        }
    }
}
