//
//  AttachementCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 11/2/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class AttachementCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    // Properties
    private var didPressDelete: (() ->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set(name: String, size: String){
        self.nameLbl.text = name
        self.sizeLbl.text = size
    }
    
    @discardableResult
    func didPressDelete(_ completion: (()->Void)?) ->Self {
        self.didPressDelete = completion
        return self
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        self.didPressDelete?()
    }
    
}
