//
//  QuestionStateCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/27/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class QuestionStateCell: UICollectionViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    func setCell(number: Int, question: QuestionsAlias,isCurrent: Bool){
        switch question.state {
        case .Wrong:
            self.parentView.backgroundColor = primaryRed
            self.borderView.borderColor = primaryRed
        case .Correct:
            self.parentView.backgroundColor = primaryGreen
            self.borderView.borderColor = primaryGreen
        case .Undefined:
            self.parentView.backgroundColor = mediumGrey
            self.borderView.borderColor = mediumGrey
        }
        self.titleLbl.text = "\(number)"
        self.borderView.isHidden = !isCurrent
    }
}
