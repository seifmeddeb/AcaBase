//
//  TutorListPresenter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 10/3/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TutorListPresentationLogic
{
    func presentTutorList(response: TutorList.Tutors.Response)
}

class TutorListPresenter: TutorListPresentationLogic
{
    weak var viewController: TutorListDisplayLogic?
    
    // MARK: Do something
    
    func presentTutorList(response: TutorList.Tutors.Response)
    {
        var tutorViewModels = [TutorViewModel]()
        
        for tutor in response.tutorList {
            let subjects = getSubjectsString(for: tutor.subjects)
            let imageUrl = URL(string: tutor.picture ?? "")
            let tutor = TutorViewModel(model: tutor, subjects: subjects, imageUrl: imageUrl)
            tutorViewModels.append(tutor)
        }
        let viewModel = TutorList.Tutors.ViewModel(tutorList: tutorViewModels)
        viewController?.displayTutorList(viewModel: viewModel)
    }
}
