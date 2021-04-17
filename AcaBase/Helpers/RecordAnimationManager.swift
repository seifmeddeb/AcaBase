//
//  RecordAnimationManager.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 3/28/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

class RecordAnimationManager {
    
    // MARK: - Properties
    
    static let shared = RecordAnimationManager()
    
    private init() {}
    
    
    var numberOfBars = 35
    var barWidth = CGFloat(5)
    var barHeight = CGFloat(45)
    var barSpace = CGFloat(2)
    var barStopHeight = CGFloat(2)
    var startOff = true
    let timerSpeed = 0.20
    let barColor = UIColor.white
    let shouldReturnDown = true
    let shouldReturnAnimated = true
    
    var animationContainer = UIView()
    var EQcontainer2 = UIView()
    
    var barArray: [AnyObject] = []
    
    func startRecordingAnimation (for view: UIView) {
        // Create UIView container
        let mycontainer = animationContainer
        mycontainer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: barHeight)
        mycontainer.backgroundColor = primaryBlue
        view.addSubview(mycontainer)
        mycontainer.center = CGPoint(x: view.frame.size.width  / 2,
                                     y: view.frame.size.height / 2)

        mycontainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mycontainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mycontainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mycontainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mycontainer.tag = 1000
        
        // Create temp object array
        var tempArray: [AnyObject] = []
        
        // Create bar UIImageView
        for i in 0...numberOfBars - 1 {
            let myImage = UIImageView()
            if i == 0 {
                myImage.frame = CGRect(x: 0, y: 0, width: barWidth, height: 0)
            } else {
                myImage.frame = CGRect(x: (CGFloat(barSpace) * CGFloat(i)) + (CGFloat(barWidth) * CGFloat(i)) , y: 0, width: barWidth, height: barStopHeight)//  * CGFloat(-1)
            }
            myImage.backgroundColor = barColor
            myImage.tag = 50 + i
            mycontainer.addSubview(myImage)
            tempArray.append(myImage)
        }
        barArray = tempArray
        
        mycontainer.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2) * CGFloat(2.0))
    }
    
    func updateAnimation(for average: Double, view: UIView?) {
        let intensity = Double(((-60 - average) / -60))
        
        let right = ((Double(self.barHeight)/2) * intensity) / 2
                    
        let tempX = barWidth + barSpace
        var i = 50
        var j = 0
        var amor = 0.0
        
        var randomVal = 0.0
        UIView.animate(withDuration: 0.35, animations: { () -> Void in
            for bar in self.barArray  {
                var val = right
                val = ((val * amor) - 1.0)
                if  j < 18 {
                    amor = amor + 0.1
                } else {
                    amor = amor - 0.1
                }
                
                if  j%2 == 0 {
                    val = val*1.2
                } else {
                    val = val*0.8
                }
                    let tempButton = view?.viewWithTag(i)
                    var rect = bar.frame
                    tempButton!.cornerRadius = self.barWidth/2
                    randomVal = 0.0
                    rect?.origin.x = CGFloat(j) * CGFloat(tempX)
                    rect?.origin.y = CGFloat(Double(self.barHeight/2)-val-randomVal)
                    rect?.size.width = CGFloat(self.barWidth)
                    rect?.size.height = CGFloat((val*2))
                    tempButton!.frame = rect!
                                    
                i = i + 1
                j += 1
            }
        })
    }
    
    func endAnimation() {
        animationContainer.removeFromSuperview()
    }
    

}
