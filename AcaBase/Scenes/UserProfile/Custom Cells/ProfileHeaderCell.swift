//
//  ProfileHeaderCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/9/2021.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class ProfileHeaderCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var statusLbl: UILabel!
    
    @IBOutlet weak var editImageView: UIImageView!
    
    @IBAction func editProfilePressed(_ sender: Any) {
    }
    
    func setup(viewModel: ProfileCellViewModel) {
        var statusIcnName = "cancel-icn"
        var statusTintColor = primaryYellow
        
        if let status = viewModel.user?.status, status == "active" {
            statusIcnName = "baseline_check_circle_black_24pt"
            statusTintColor = primaryGreen
        }
        
        let statusImage = UIImage(named: statusIcnName)
        self.statusImageView.image = statusImage
        self.statusImageView.image = statusImageView.image?.withRenderingMode(.alwaysTemplate)
        self.statusImageView.tintColor = statusTintColor
        self.statusLbl.textColor = statusTintColor
        
        self.editImageView.image = UIImage(named: "edit-icn")
        self.editImageView.image = editImageView.image?.withRenderingMode(.alwaysTemplate)
        self.editImageView.tintColor = .white
        
        self.nameLbl.text = "\(viewModel.user?.firstName ?? "") \(viewModel.user?.lastName ?? "")"
        self.statusLbl.text = "\(viewModel.user?.status ?? "")"
        self.profileImageView.setImageAsync(url: URL(string: "\(mainUrl)\(viewModel.user?.picture ?? "")"), placeholder: UIImage(named: "image-not-found"))
    }
}
