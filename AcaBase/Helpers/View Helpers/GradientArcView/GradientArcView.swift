//
//  GradientArcView.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 11/28/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientArcView: UIView {
    @IBInspectable var startColor: UIColor = .white { didSet { setNeedsLayout() } }
    @IBInspectable var endColor:   UIColor = .blue  { didSet { setNeedsLayout() } }
    @IBInspectable var lineWidth:  CGFloat = 5      { didSet { setNeedsLayout() } }
    @IBInspectable var startAngle:   Double = -81  { didSet { setNeedsLayout() } }
    var bgColor : UIColor = .white
    
    var gradientLayerStartPoint : CGPoint = CGPoint(x: 0.5, y: 0.5)
    var gradientLayerEndPoint : CGPoint = CGPoint(x: 0.5, y: 0)
    
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .conic
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        return gradientLayer
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configure()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    func setValue(_ value: Int, _ total: Int, coef: Double? = 1.0, isAnimated: Bool? = false) {
        var angle = ((Double(value) / Double(total)) * Double(360)) + Double(startAngle)
        angle = angle * coef!
        updateGradient(angle, isAnimated: isAnimated)
    }
    
    func setProfileValue(_ value: Int, _ total: Int, coef: Double? = 1.0, isAnimated: Bool? = false) {
        var angle = ((Double(value) / Double(total)) * Double(360)) + Double(startAngle)
        angle = angle * coef!
        updateProfileGradient(angle, isAnimated: isAnimated)
    }
    
    func setGradientLayerPoints(start: CGPoint, end: CGPoint) {
        gradientLayer.startPoint = start
        gradientLayer.endPoint = end
    }
    
}

private extension GradientArcView {
    func configure() {
        layer.addSublayer(gradientLayer)
    }

    func updateGradient() {
        gradientLayer.frame = bounds
        gradientLayer.colors = [endColor, startColor].map { $0.cgColor }

        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = ((min(bounds.width, bounds.height) - lineWidth) / 2) - 9
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: deg2rad(startAngle), endAngle: deg2rad(220), clockwise: true)
        path.lineCapStyle = .round
        let mask = CAShapeLayer()
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = bgColor.cgColor
        mask.lineWidth = lineWidth
        mask.path = path.cgPath
        mask.lineCap = .round
        gradientLayer.mask = mask
    }
    
    func updateGradient(_ endAngle: Double, isAnimated: Bool? = false) {
        gradientLayer.frame = bounds
        gradientLayer.colors = [endColor, startColor].map { $0.cgColor }

        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = ((min(bounds.width, bounds.height) - lineWidth) / 2) - 9
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: deg2rad(startAngle), endAngle: deg2rad(endAngle), clockwise: true)
        path.lineCapStyle = .round
        let mask = CAShapeLayer()
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = bgColor.cgColor
        mask.lineWidth = lineWidth
        mask.path = path.cgPath
        mask.lineCap = .round
        gradientLayer.mask = mask
        
        if let animated = isAnimated, animated {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = 1
            animation.duration = 1
            mask.add(animation, forKey: "line")
        }
    }
    
    func updateProfileGradient(_ endAngle: Double, isAnimated: Bool? = false) {
        gradientLayer.frame = bounds
        gradientLayer.colors = [endColor, startColor].map { $0.cgColor }

        let center = CGPoint(x: bounds.midX + 15.0, y: bounds.midY + 15.0)
        let radius = ((min(bounds.width, bounds.height) - lineWidth) / 2)
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: deg2rad(startAngle), endAngle: deg2rad(endAngle), clockwise: true)
        path.lineCapStyle = .round
        let mask = CAShapeLayer()
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = bgColor.cgColor
        mask.lineWidth = lineWidth
        mask.path = path.cgPath
        mask.lineCap = .round
        gradientLayer.mask = mask
        
        if let animated = isAnimated, animated {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = 1
            animation.duration = 1
            mask.add(animation, forKey: "line")
        }
    }
}
func deg2rad(_ number: Double) -> CGFloat {
    return CGFloat(number * .pi / 180)
}
