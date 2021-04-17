//
//  DiscussionPresenter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 3/5/21.
//  Copyright (c) 2021 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DiscussionPresentationLogic
{
  func presentDiscussionsList(response: Discussion.List.Response)
}

class DiscussionPresenter: DiscussionPresentationLogic
{
  weak var viewController: DiscussionDisplayLogic?
  
  // MARK: present DiscussionsList
  
  func presentDiscussionsList(response: Discussion.List.Response)
  {
    var viewModels = [DiscussionViewModel]()
    if let discussionList = response.discussions {
        for item in discussionList {
            if let tutor = response.tutors?.filter({$0.objectId == item.trainerId}).first {
                var url = URL(string: mainUrl)
                if let picture = tutor.picture {
                    url = URL(string: picture)
                }
                viewModels.append(DiscussionViewModel(url: url, tutor: tutor, model: item))
            }
        }
    }
    let viewModel = Discussion.List.ViewModel(discussions: viewModels)
    viewController?.displayDiscussionsList(viewModel: viewModel)
  }
}
