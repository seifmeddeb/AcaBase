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
    
    
    func set(trainer: TutorDAO){
        trainerImageView.setImageAsync(url: URL(string:trainer.picture ?? ""))
        nameLabel.text = trainer.fullName
        subjectLabel.text = trainer.followers ?? ""
        answersNbrLabel.text = "\(trainer.answredQuestions) Answers"
        
    }
}
