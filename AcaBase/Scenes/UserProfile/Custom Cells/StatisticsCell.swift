//
//  StatisticsCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/9/2021.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class StatisticsCell: UICollectionViewCell {
    
    @IBOutlet weak var statView: GradientArcView!
    @IBOutlet weak var bgProgressView: GradientArcView!
    @IBOutlet weak var statContentView: UIView!
    
    @IBOutlet weak var statImageView: UIImageView!
    @IBOutlet weak var statValueLbl: UILabel!
    @IBOutlet weak var statTypeLbl: UILabel!
    
    @IBOutlet weak var minValueLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var totalValueLbl: UILabel!
    
    
    func setup(viewModel: ProfileCellViewModel) {
        
        let color = viewModel.color ?? primaryBlue
        if let statTypeImage = viewModel.image {
            statImageView.image = statTypeImage
            statImageView.image = statImageView.image?.withRenderingMode(.alwaysTemplate)
            statImageView.tintColor = color
        }
        
        self.statContentView.cornerRadius = self.frame.width/4
        self.statContentView.layoutIfNeeded()
        
        // Sttings the place holder Arc
        self.bgProgressView.lineWidth = 3.0
        self.bgProgressView.setProfileValue(20, 20, coef: 0.765)
        self.bgProgressView.setNeedsLayout()
        
        // Sttings the value Arc
        if viewModel.value > 0 {
            self.statView.startAngle = 150.0
            self.statView.lineWidth = 8.0
            self.statView.bgColor = bgColorArcView
            self.statView.startColor = color
            self.statView.endColor = color.withAlphaComponent(0.1)
            self.statView.setGradientLayerPoints(start: CGPoint(x: 0.5, y: 0.5), end: CGPoint(x: 0.75, y: 1.0))
            self.statView.setProfileValue(viewModel.value, viewModel.total, coef: 0.765, isAnimated: true)
            self.statView.setNeedsLayout()
        }
        
        // setting the texts
        let value = (viewModel.value == 999) ? "∞" : "\(viewModel.value)"
        let total = (viewModel.total == 999) ? "∞" : "\(viewModel.total)"
        //self.minValueLbl.text = "\(viewModel.value)"
        self.statValueLbl.text = "\(value)"
        self.totalValueLbl.text = "\(total)"
        self.statTypeLbl.text = viewModel.subtitle ?? ""
        self.titleLbl.text = viewModel.title ?? ""
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.statContentView.cornerRadius = self.statContentView.frame.width/2
        self.statContentView.layoutIfNeeded()
    }
    
    
}
