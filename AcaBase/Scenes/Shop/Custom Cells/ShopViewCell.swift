//
//  ShopViewCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/10/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class ShopViewCell: UICollectionViewCell {
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var oldPriceLbl: UILabel!
    @IBOutlet weak var newPriceLbl: UILabel!
    @IBOutlet weak var oldPriceLineView: UIView!
    
    @IBOutlet weak var discountView: UIView!
    @IBOutlet weak var discountLbl: UILabel!
    
    func setCell(viewModel: OfferViewModel) {
        self.bgImageView.setImageAsync(url: viewModel.imageUrl)
        self.bgImageView.clipsToBounds = true
        self.bgImageView.layer.cornerRadius = 15
        self.bgImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.titleLbl.text = viewModel.model.title
        self.descLbl.text = viewModel.model.desc
        self.durationLbl.text = viewModel.model.duration
        self.priceLbl.text = "\(viewModel.model.newPrice)€"
        self.newPriceLbl.text = "\(viewModel.model.newPrice)€"
        
        self.discountLbl.textColor = .white
        self.discountLbl.font = UIFont(name: "Roboto-Bold", size: 11)
        self.discountLbl.text = "\(viewModel.model.percentagePromo ?? 0)%"
        self.discountView.isHidden = false
        
        if viewModel.model.percentagePromo ?? 0 == 0 {
            self.discountView.isHidden = true
        }
        
        if let price = viewModel.model.oldPrice {
            self.oldPriceLbl.text = "\(price)€"
            priceLbl.isHidden = true
            oldPriceLineView.isHidden = false
            oldPriceLbl.isHidden = false
            newPriceLbl.isHidden = false
        } else {
            priceLbl.isHidden = false
            oldPriceLineView.isHidden = true
            oldPriceLbl.isHidden = true
            newPriceLbl.isHidden = true
        }
    }
}
