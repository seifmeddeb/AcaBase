//
//  RatingView.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 10/25/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class RatingView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet var stars: [UIImageView]!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    var isEditable : Bool = false {
        didSet {
            if !oldValue {
                self.setGestureReconizer()
            }
        }
    }
    
    var rating = 0
    
    private func commonInit() {
        Bundle.main.loadNibNamed("RatingView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        self.contentView.isUserInteractionEnabled = true
    }
    
    func setRating(rating: Int) {
        self.rating = rating
        ratingLabel.text = "\(rating).0"
        //let roundRating = Int(rating.rounded())
        for star in stars {
            star.tintColor = primaryGrey
            if star.tag <= rating {
                star.tintColor = starColor
            }
        }
    }
    
    func setGestureReconizer() {
        for star in stars {
            star.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleStarTap(_:)))
            star.addGestureRecognizer(tap)
        }
    }
    
    @objc func handleStarTap(_ sender: UITapGestureRecognizer? = nil) {
        
        let tag = sender?.view?.tag ?? 0
        self.setRating(rating: tag)
    }

}
