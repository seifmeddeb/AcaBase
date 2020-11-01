//
//  TutorListViewController.swift
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

protocol TutorListDisplayLogic: class
{
    func displayTutorList(viewModel: TutorList.Tutors.ViewModel)
    func displayFilteredTutorList(viewModel: TutorList.FilterTutors.ViewModel)
}

class TutorListViewController: UIViewController, TutorListDisplayLogic
{
    var interactor: TutorListBusinessLogic?
    var router: (NSObjectProtocol & TutorListRoutingLogic & TutorListDataPassing)?
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
        let interactor = TutorListInteractor()
        let presenter = TutorListPresenter()
        let router = TutorListRouter()
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
        getTutorsList()
        navigationController?.delegate = self
        self.title = "Find a tutor"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.resetNavBarWhenAppearing()
    }
    
    // MARK: Properties
    
    var tutorList = [TutorViewModel]()
    var searchBar : UISearchBar!
    var selectATutor = false
    var selectedTutor : TutorViewModel?
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: getTutorsList
    func getTutorsList()
    {
        let request = TutorList.Tutors.Request()
        interactor?.getTutors(request: request)
    }
    
    func displayTutorList(viewModel: TutorList.Tutors.ViewModel)
    {
        self.tutorList = viewModel.tutorList
        selectATutor = viewModel.isSelection
        self.setSearchBarUI(subjects: viewModel.subjectsList)
        let scopeTitle = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex]
        filterTutorsList(subject: scopeTitle, tutorName: searchBar.text)
    }
    
    // MARK: filterTutorsList
    func filterTutorsList(subject: String?, tutorName: String?)
    {
        let request = TutorList.FilterTutors.Request(subject: subject, tutorName: tutorName)
        interactor?.filterTutors(request: request)
    }
    
    func displayFilteredTutorList(viewModel: TutorList.FilterTutors.ViewModel) {
        self.tutorList = viewModel.filtredTutorList
        self.tableView.reloadData()
    }
}
// MARK: UISearchBarDelegate
extension TutorListViewController : UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        let scopeTitle = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex]
        filterTutorsList(subject: scopeTitle, tutorName: searchBar.text)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let scopeTitle = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex]
        filterTutorsList(subject: scopeTitle, tutorName: searchBar.text)
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        // aka subject
        let scopeTitle = searchBar.scopeButtonTitles?[selectedScope]
        filterTutorsList(subject: scopeTitle, tutorName: searchBar.text)
    }
    
}
// MARK: UITableView Delegate methods
extension TutorListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TutorCell", for: indexPath) as! TutorCell
        let viewModel = self.tutorList[indexPath.row]
        cell.set(tutor: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectATutor {
            self.selectedTutor = self.tutorList[indexPath.row]
            self.navigationController?.popViewController(animated: true)
        }
        performSegue(withIdentifier: "DetailTutor", sender: self)
    }
}
extension TutorListViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let viewController = viewController as? QuestionViewController {
            // FIXME: Fix me Not so clean architecture
            viewController.tutor = self.selectedTutor
            viewController.subjects = self.selectedTutor?.model.subjects ?? [SubjectDAO]()
        }
    }
}

// MARK: Tutor TableViewCell
class TutorCell : UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subjectsLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var pictureImgView: UIImageView!
    @IBOutlet weak var ratingView : RatingView!
    func set(tutor: TutorViewModel) {
        nameLabel.text = tutor.model.fullName
        subjectsLabel.text = tutor.subjects
        answersLabel.attributedText = tutor.answeredQuestions
        pictureImgView.setImageAsync(url: tutor.imageUrl)
        ratingView.setRating(rating: tutor.model.rate)
    }
    
}
