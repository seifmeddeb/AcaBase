//
//  TutorViewController.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/27/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TutorDisplayLogic: class
{
    func displayTutor(viewModel: Tutor.Display.ViewModel)
    func displayFavorite(viewModel: Tutor.Favorite.ViewModel)
}

class TutorViewController: UIViewController, TutorDisplayLogic
{
    var interactor: TutorBusinessLogic?
    var router: (NSObjectProtocol & TutorRoutingLogic & TutorDataPassing)?
    
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
        let interactor = TutorInteractor()
        let presenter = TutorPresenter()
        let router = TutorRouter()
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
        showTutor()
        contentViewHeightConstraint.constant = self.view.bounds.height
        self.view.layoutIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.4)
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.dismissViewController (_:)))
        gesture.delegate = self
        self.parentContentView.addGestureRecognizer(gesture)
        if parentScrollView.contentOffset.y <= 0 {
            self.contentScrollView.isUserInteractionEnabled = false
        } else {
            self.contentScrollView.isUserInteractionEnabled = true
        }
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {   super.viewDidDisappear(animated)
        self.view.backgroundColor = UIColor.clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: Properties
    var feedBackList = [FeedBackDAO]()
    var tutor : TutorDAO?
    // MARK: IBOutlets
    @IBOutlet weak var parentScrollView: UIScrollView!
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var scrollViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var ratingsValueLabel: UILabel!
    @IBOutlet weak var ratingsNameLabel: UILabel!
    @IBOutlet weak var answersValueLabel: UILabel!
    @IBOutlet weak var answersNameLabel: UILabel!
    @IBOutlet weak var favouriteValueLabel: UILabel!
    @IBOutlet weak var favouriteNameLabel: UILabel!
    @IBOutlet weak var reactivityValueLabel: UILabel!
    @IBOutlet weak var reactivityNameLabel: UILabel!
    @IBOutlet weak var experienceTitleLbl: UILabel!
    @IBOutlet weak var experienceDescLbl: UILabel!
    @IBOutlet weak var reviewsTitleLbl: UILabel!
    @IBOutlet weak var parentContentView: UIView!
    @IBOutlet weak var reviewsTableView: UITableView!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var favTutorBtn: UIButton!
    
    
    
    
    // MARK: showTutor
    func showTutor()
    {
        let request = Tutor.Display.Request()
        interactor?.getTutor(request: request)
    }
    
    func displayTutor(viewModel: Tutor.Display.ViewModel)
    {
        if let tutor = viewModel.tutor {
            self.tutor = tutor
            self.favTutorBtn.isSelected = tutor.isFav
            self.profileImageView.setImageAsync(url: viewModel.pictureUrl)
            self.nameLabel.text = tutor.fullName
            self.subjectLabel.text = viewModel.subjects
            self.ratingsValueLabel.text = "\(tutor.rate)"
            self.favouriteValueLabel.text = tutor.inFavNbr ?? "0"
            self.answersValueLabel.text = "\(tutor.answredQuestions)"
            self.reactivityValueLabel.text = tutor.reactivity
            self.experienceDescLbl.text = tutor.cv
            
            if let feedBackList = tutor.feedBacks, feedBackList.count > 0  {
                self.reviewsTableView.isHidden = false
                self.feedBackList = feedBackList
                self.reviewsTableView.reloadData()
            } else {
                self.reviewsTableView.isHidden = true
            }
        }
    }
    
    // MARK: addFavorite
    func addOrRemoveFavorite()
    {
        Indicator.sharedInstance.showIndicator()
        if self.tutor?.isFav ?? false {
            let request = Tutor.Favorite.Request(isFav: self.tutor?.isFav ?? false)
            interactor?.removeFromFavorites(request: request)
        } else {
            let request = Tutor.Favorite.Request(isFav: self.tutor?.isFav ?? false)
            interactor?.addToFavorites(request: request)
        }
    }
    
    func displayFavorite(viewModel: Tutor.Favorite.ViewModel) {
        Indicator.sharedInstance.hideIndicator()
        self.tutor?.isFav = viewModel.isFav
        favTutorBtn.isSelected = viewModel.isFav
        let alert = UIAlertController(title: "", message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true)
    }
    
    // MARK: Actions
    
    @IBAction func askQuestionPressed(_ sender: Any) {
    }
    @IBAction func addToFavouritePressed(_ sender: Any) {
        addOrRemoveFavorite()
    }
    @objc func dismissViewController(_ sender:UITapGestureRecognizer){
        let touchPoint = sender.location(in: self.view)

        if touchPoint.y < (self.contentScrollView.frame.origin.y + 40) {
            self.dismiss()
        } else {
            let bottomOffset = CGPoint(x: 0, y: parentScrollView.contentSize.height - parentScrollView.bounds.size.height)
            parentScrollView.setContentOffset(bottomOffset, animated: true)
            self.contentScrollView.isUserInteractionEnabled = true
        }
    }
}
extension TutorViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.parentContentView
    }
}

extension TutorViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == parentScrollView {
            if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
                //reach bottom
                contentScrollView.isScrollEnabled = true
            }
            
        }
        if scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.bounds.height {
                scrollView.contentOffset.y = scrollView.contentSize.height - scrollView.bounds.height
        }
        
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView == contentScrollView {
            scrollView.isScrollEnabled = !(parentScrollView.contentOffset.y <= 0)
        }
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView == contentScrollView {
            scrollView.isScrollEnabled = !(parentScrollView.contentOffset.y <= 0)
        }
        if scrollView == parentScrollView {
            if scrollView.contentOffset.y <= 0 {
                self.dismiss()
            }
            // minimize view
            if scrollView.contentOffset.y <= 120 {
                scrollView.setContentOffset(CGPoint.zero, animated: true)
                self.contentScrollView.isUserInteractionEnabled = false
            }
            // maximize view
            if scrollView.contentOffset.y > 120 {
                let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
                scrollView.setContentOffset(bottomOffset, animated: true)
                self.contentScrollView.isUserInteractionEnabled = true
            }
        }
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView == contentScrollView {
            scrollView.isScrollEnabled = !(parentScrollView.contentOffset.y <= 0)
        }
        // dismiss view
        if scrollView == parentScrollView {
            if scrollView.contentOffset.y <= 0 {
                self.dismiss()
            }
            
            // minimize view
            if scrollView.contentOffset.y <= 120 {
                scrollView.setContentOffset(CGPoint.zero, animated: true)
            }
            // maximize view
            if scrollView.contentOffset.y > 120 {
                let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
                scrollView.setContentOffset(bottomOffset, animated: true)
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == parentScrollView {
            if scrollView.contentOffset.y <= 0 {
                self.dismiss()
            }
        }
    }
    
    func dismiss(){
        self.view.backgroundColor = UIColor.clear
        self.router?.routeToTutorsList(segue: nil)
    }
}
extension TutorViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedBackList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatingCell", for: indexPath) as! RatingCell
        let viewModel = self.feedBackList[indexPath.row]
        cell.set(feedBack: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
// MARK: Rating TableViewCell
class RatingCell : UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    
    func set(feedBack: FeedBackDAO) {
        userNameLabel.font = UIFont.italicSystemFont(ofSize: 12)
        userNameLabel.text = "\"\(feedBack.userName ?? "")\""
        subjectLabel.text = feedBack.subject
        descriptionLabel.text = feedBack.comment
        ratingView.setRating(rating: Int(feedBack.rate ?? "0") ?? 0)
    }
    
}
