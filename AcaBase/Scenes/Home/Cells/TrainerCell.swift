//
//  TrainerCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/9/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class TrainerCell: UICollectionViewCell {
    
    @IBOutlet weak var trainerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var answersNbrLabel: UILabel!
    @IBOutlet weak var ratingView : RatingView!
    
    func set(trainer: TutorViewModel){
        trainerImageView.setImageAsync(url: trainer.imageUrl)
        nameLabel.text = trainer.model.fullName
        subjectLabel.text = trainer.subjects
        answersNbrLabel.attributedText = trainer.answeredQuestions
        ratingView.setRating(rating: trainer.model.rate)
    }
}
