//
//  ChapterCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 11/29/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class ChapterCell: UICollectionViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var savedQuizesLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setChapter(viewModel: ChapterDAO) {
        titleLbl.text = viewModel.title ?? ""
        savedQuizesLbl.text = "0 Quiz passé sur \(viewModel.quizs?.count ?? 0) disponible"
    }

}
