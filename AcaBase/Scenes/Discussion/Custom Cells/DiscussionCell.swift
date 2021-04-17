//
//  DiscussionCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 3/6/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class DiscussionCell: UITableViewCell {

    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var tutorLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var tutorImgView: UIImageView!
    @IBOutlet weak var favoriteBtn: UIButton!
    
    // Properties
    private var didPressDelete: (() ->Void)?
    private var didPressFavorite: (() ->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDiscussion(viewModel: DiscussionViewModel) {
        questionLbl.text = "\(viewModel.model.subject ?? "No subject")"
        tutorLbl.text = viewModel.tutor?.fullName ?? "N/A"
        descLbl.text = "\(viewModel.model.lastMessage ?? "No Last Message")"
        tutorImgView.setImageAsync(url: viewModel.url, placeholder: #imageLiteral(resourceName: "default-user-avatar"))
        statusView.isHidden = true
        
        if !(viewModel.model.started ?? false) {
            statusView.backgroundColor = starColor
            statusView.isHidden = false
            statusLbl.text = "Attente"
        }
        
        if (viewModel.model.closed ?? false) {
            statusView.backgroundColor = lightGrey
            statusView.isHidden = false
            statusLbl.text = "Terminé"
        }
        
        if (viewModel.model.favorite ?? false) {
            favoriteBtn.tintColor = starColor
        } else {
            favoriteBtn.tintColor = primaryGrey
        }
    }
    
    @discardableResult
    func didPressDelete(_ completion: (()->Void)?) ->Self {
        self.didPressDelete = completion
        return self
    }
    
    @discardableResult
    func didPressFavorite(_ completion: (()->Void)?) ->Self {
        self.didPressFavorite = completion
        return self
    }

    @IBAction func deletePressed(_ sender: Any) {
        didPressDelete?()
    }
    @IBAction func favoritePressed(_ sender: Any) {
        didPressFavorite?()
    }
}
