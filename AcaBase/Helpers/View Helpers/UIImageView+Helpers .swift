//
//  UIImageView+Helpers .swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/9/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit
import AVKit

extension UIImageView {
    public func setImageAsync(url: URL?, placeholder: UIImage? = nil){
        self.image = nil
        guard let url = url else {return}
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                guard let data = data else {
                    if let image = placeholder {
                        self.image = image
                    }
                    return
                }
                self.image = UIImage(data: data)
            }
        }
    }
    
    public func setVideoThumbnail(from url: URL){
        
        if url.host == "youtu.be" {
            let urlString = "http://img.youtube.com/vi/\(url.lastPathComponent)/1.jpg"
            if let url = URL(string: urlString) {
                self.setImageAsync(url: url)
                return
            }
        } else {
            
            let asset = AVAsset(url: url)
            let assetImgGenerate = AVAssetImageGenerator(asset: asset)
            assetImgGenerate.appliesPreferredTrackTransform = true
            assetImgGenerate.maximumSize = CGSize(width: 130, height: 50)
            
            let time = CMTimeMakeWithSeconds(0.0, preferredTimescale: 20)
            do {
                let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
                let thumbnail = UIImage(cgImage: img)
                self.image = thumbnail
                return
            }
            catch {
                //print(error.localizedDescription)
                self.image = UIImage(named: "image-not-found")!
                return
            }
        }
        self.image = UIImage(named: "image-not-found")!
    }
}

public func getImageAsync(url: URL?,completion: @escaping (UIImage?) -> ()) {
    guard let url = url else {return}
    DispatchQueue.global().async {
        let data = try? Data(contentsOf: url)
        DispatchQueue.main.async {
            guard let data = data else {return }
            completion(UIImage(data: data))
        }
    }
}
