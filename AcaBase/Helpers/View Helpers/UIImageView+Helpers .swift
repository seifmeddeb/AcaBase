//
//  UIImageView+Helpers .swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/9/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func setImageAsync(url: URL?){
        self.image = nil
        guard let url = url else {return}
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                guard let data = data else {return}
                self.image = UIImage(data: data)
            }
        }
    }
}
