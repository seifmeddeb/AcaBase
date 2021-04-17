//
//  Indicator.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 1/24/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

public class Indicator {

    public static let sharedInstance = Indicator()
    var blurImg = UIImageView()
    var indicator = UIActivityIndicatorView()

    private init()
    {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = UIColor.black
        blurImg.isUserInteractionEnabled = true
        blurImg.alpha = 0.5
        if #available(iOS 13.0, *) {
            indicator.style = .large
        } else {
            indicator.style = .whiteLarge
        }
        indicator.center = blurImg.center
        indicator.startAnimating()
        indicator.color = primaryGreen
    }

    func showIndicator(for view: UIView? = nil){
        DispatchQueue.main.async( execute: {
            if let view = view {
                view.addSubview(self.blurImg)
                view.addSubview(self.indicator)
            } else {
                let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
                window?.addSubview(self.blurImg)
                window?.addSubview(self.indicator)
            }
        })
    }
    func hideIndicator(){

        DispatchQueue.main.async( execute:
            {
                self.blurImg.removeFromSuperview()
                self.indicator.removeFromSuperview()
        })
    }
}
