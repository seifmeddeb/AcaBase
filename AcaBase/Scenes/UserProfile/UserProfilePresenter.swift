//
//  UserProfilePresenter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/17/21.
//  Copyright (c) 2021 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol UserProfilePresentationLogic
{
    func presentProfile(response: UserProfile.Profile.Response)
}

class UserProfilePresenter: UserProfilePresentationLogic
{
    weak var viewController: UserProfileDisplayLogic?
    
    // MARK: presentProfile
    
    func presentProfile(response: UserProfile.Profile.Response)
    {
        if let user = response.user {
            var profileList = [ProfileCellType]()
            profileList.append(.header(UserProfile.Profile.ViewModel.Item(user: user)))
            
            profileList.append(.stat(UserProfile.Profile.ViewModel.Item(title: "Nombre de sessions", subtitle: "Sessions", color: primaryGreen, user: user, image: UIImage(named: "solved-questions-icon"),value: user.statistics?.leftQuestions ?? 1,total: user.statistics?.totalQuestions ?? 1)))
            profileList.append(.stat(UserProfile.Profile.ViewModel.Item(title: "Nombre de Jours", subtitle: "Jours", color: primaryBlue, user: user, image: UIImage(named: "calendar-icn"),value: user.statistics?.leftDays ?? 1,total: user.statistics?.totalDays ?? 1)))
            
            profileList.append(.simple(UserProfile.Profile.ViewModel.Item(title: "Mes tuteurs préférés", image: UIImage(named: "Favourite-Tutor icon"), hasSmallSeparator: true)))
            profileList.append(.simple(UserProfile.Profile.ViewModel.Item(title: "Mon parcours d’apprentissage", image: UIImage(named: "Learning-path icon"))))
            profileList.append(.simple(UserProfile.Profile.ViewModel.Item(title: "paramètres du compte", image: UIImage(named: "account-setting icon"), hasBigSeparator: true)))
            profileList.append(.simple(UserProfile.Profile.ViewModel.Item(title: "À propos", image: UIImage(named: "about-icon"), hasBigSeparator: true, hasSmallSeparator: true)))
            profileList.append(.simple(UserProfile.Profile.ViewModel.Item(title: "Contactez-nous", image: UIImage(named: "contact-us icon"))))
            profileList.append(.simple(UserProfile.Profile.ViewModel.Item(title: "Se déconnecter", image: UIImage(named: "logout-icon"), hasBigSeparator: true)))
            
            let viewModel = UserProfile.Profile.ViewModel(profileList: profileList, errorMsg: nil)
            viewController?.displayProfile(viewModel: viewModel)
        } else {
            let viewModel = UserProfile.Profile.ViewModel(profileList: nil, errorMsg: response.errorMsg ?? "")
            viewController?.displayProfileError(viewModel: viewModel)
        }
    }
}
