//
//  QuestionResponseCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/27/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class QuestionResponseCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var imageForCell: UIImageView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomSeparator: UIView!
    @IBOutlet weak var topSeparator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setQuestion(_ viewModel: QuestionItemAlias){
        self.titleLbl.text = viewModel.title
        self.descLbl.text = viewModel.desc
        if let imageUrl = viewModel.imageUrl {
            self.imageForCell.setImageAsync(url: imageUrl)
            self.imageHeightConstraint.constant = 150
        }
        self.bottomSeparator.isHidden = false
        self.topSeparator.isHidden = true
    }
    
    func setAnswer(_ viewModel: QuestionItemAlias){
        self.titleLbl.text = viewModel.title
        self.descLbl.text = viewModel.desc
        if let imageUrl = viewModel.imageUrl {
            self.imageForCell.setImageAsync(url: imageUrl)
            self.imageHeightConstraint.constant = 150
        }
        
        self.bottomSeparator.isHidden = true
        self.topSeparator.isHidden = false
    }
}
