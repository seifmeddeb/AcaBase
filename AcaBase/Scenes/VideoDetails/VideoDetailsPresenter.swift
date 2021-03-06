//
//  VideoDetailsPresenter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 2/14/21.
//  Copyright (c) 2021 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol VideoDetailsPresentationLogic
{
    func presentVideoData(response: VideoDetails.Load.Response)
}

class VideoDetailsPresenter: VideoDetailsPresentationLogic
{
    weak var viewController: VideoDetailsDisplayLogic?
    
    // MARK: presentVideoData
    
    func presentVideoData(response: VideoDetails.Load.Response)
    {
        if let url = response.videoUrl {
            let viewModel = VideoDetails.Load.ViewModel(videoUrl: url)
            viewController?.displayVideoData(viewModel: viewModel)
        }
    }
}
