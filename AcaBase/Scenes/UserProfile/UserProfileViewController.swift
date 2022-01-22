//
//  UserProfileViewController.swift
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

protocol UserProfileDisplayLogic: class
{
    func displayProfile(viewModel: UserProfile.Profile.ViewModel)
    func displayProfileError(viewModel: UserProfile.Profile.ViewModel)
}

class UserProfileViewController: UIViewController, UserProfileDisplayLogic
{
    var interactor: UserProfileBusinessLogic?
    var router: (NSObjectProtocol & UserProfileRoutingLogic & UserProfileDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = UserProfileInteractor()
        let presenter = UserProfilePresenter()
        let router = UserProfileRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        getProfile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNormalNavBarWhenAppearing()
        self.title = "Profile"
    }
    
    // MARK: - @IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var profileList = [ProfileCellType]()
    
    // MARK: getProfile
    func getProfile()
    {
        Indicator.sharedInstance.showIndicator()
        let request = UserProfile.Profile.Request()
        interactor?.getProfile(request: request)
    }
    
    func displayProfile(viewModel: UserProfile.Profile.ViewModel)
    {
        Indicator.sharedInstance.hideIndicator()
        self.profileList = viewModel.profileList ?? [ProfileCellType]()
        self.collectionView.reloadData()
    }
    
    func displayProfileError(viewModel: UserProfile.Profile.ViewModel) {
        Indicator.sharedInstance.hideIndicator()
        let alert = UIAlertController(title: "Oups 😥", message: viewModel.errorMsg ?? "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
    
}
extension UserProfileViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if profileList.count == 0 { return 0 }
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return 2
        } else {
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var item = profileList[indexPath.row]
        
        if indexPath.section == 0 {
            item = profileList[0]
        } else if indexPath.section == 1 {
            item = profileList[indexPath.row+1]
        } else {
            item = profileList[indexPath.row+3]
        }

        switch item {
        case .header(let item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileHeaderCell", for: indexPath) as! ProfileHeaderCell
            
            cell.setup(viewModel: item)
            return cell
        case .stat(let item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatisticsCell", for: indexPath) as! StatisticsCell
            
            cell.setup(viewModel: item)
            return cell
            
        case .simple(let item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileItemCell", for: indexPath) as! ProfileItemCell
            
            cell.setup(viewModel: item)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: 193.0)
        } else if indexPath.section == 1 {
            return CGSize(width: (collectionView.frame.width/2), height: 175.0)
        } else {
            return CGSize(width: collectionView.frame.width, height: 60.0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var item = profileList[indexPath.row]
        
        if indexPath.section == 0 {
            item = profileList[0]
        } else if indexPath.section == 1 {
            item = profileList[indexPath.row+1]
        } else {
            item = profileList[indexPath.row+3]
        }
        
        switch item {
            case .header:
                break
            case .stat:
                break
            case .simple:
                if indexPath.row == 0 {
                    self.router?.routeToFavTutorList(segue: nil)
                } else if  indexPath.row == 1 {
                    self.router?.routeToMyLearningPath(segue: nil)
                }
        }
    }
}