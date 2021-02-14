//
//  QuizCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/23/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class QuizCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var progressLbl: UILabel!
    @IBOutlet weak var progressView: GradientView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(with viewModel: QuizAlias){
        self.titleLbl.text = viewModel.model.title ?? ""
        self.descLbl.text = viewModel.model.desc ?? ""
        self.progressLbl.text = "\(viewModel.progress)"
    }
    
}
