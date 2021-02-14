//
//  GradientView.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/26/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = primaryBlue
    @IBInspectable var endColor: UIColor = primaryGreen
        
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()!
        let colors = [startColor.cgColor, endColor.cgColor]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)!
        
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: bounds.width, y: 0)
        context.drawLinearGradient(gradient,
                                   start: startPoint,
                                   end: endPoint,
                                   options: [CGGradientDrawingOptions(rawValue: 0)])
    }
}
