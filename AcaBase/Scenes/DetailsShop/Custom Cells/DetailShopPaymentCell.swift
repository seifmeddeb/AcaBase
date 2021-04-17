//
//  DetailShopPaymentCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/15/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class DetailShopPaymentCell: UITableViewCell {

    // Properties
    private var didPressPay: (() ->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @discardableResult
    func didPressPayDelegate(_ completion: (()->Void)?) ->Self {
        self.didPressPay = completion
        return self
    }

    @IBAction func didPressPay(_ sender: Any) {
        didPressPay?()
    }
    
}
