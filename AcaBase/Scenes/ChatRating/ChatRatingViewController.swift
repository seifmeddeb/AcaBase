//
//  ChatRatingViewController.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/3/21.
//  Copyright (c) 2021 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ChatRatingDisplayLogic: class
{
    func displayTutorInfo(viewModel: ChatRating.Tutor.ViewModel)
    func displaySubmitRating(viewModel: ChatRating.SubmitRating.ViewModel)
    func displaySubmitRatingError(viewModel: ChatRating.SubmitRating.ViewModel)

}

class ChatRatingViewController: UIViewController, ChatRatingDisplayLogic
{
    var interactor: ChatRatingBusinessLogic?
    var router: (NSObjectProtocol & ChatRatingRoutingLogic & ChatRatingDataPassing)?
    
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
        let interactor = ChatRatingInteractor()
        let presenter = ChatRatingPresenter()
        let router = ChatRatingRouter()
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
        getTutor()
        self.view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleBgViewTap(_:)))
        bgView.addGestureRecognizer(tap)
        self.ratingView.isUserInteractionEnabled = true
        ratingView.isEditable = true
        ratingView.setRating(rating: 5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Properties
    
    // MARK: - IBOutlets
    @IBOutlet weak var tutorImageView: UIImageView!
    @IBOutlet weak var tutorNameLbl: UILabel!
    @IBOutlet weak var tutorSubcjectsLbl: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var horizontalConstraint: NSLayoutConstraint!
    @IBOutlet var bgView: UIView!
    
    
    // MARK: - getTutor
    func getTutor()
    {
        let request = ChatRating.Tutor.Request()
        interactor?.getTutor(request: request)
    }
    
    func displayTutorInfo(viewModel: ChatRating.Tutor.ViewModel)
    {
        self.tutorImageView.setImageAsync(url: viewModel.pictureUrl)
        self.tutorNameLbl.text = viewModel.tutor.fullName
        self.tutorSubcjectsLbl.text = viewModel.subjects
    }
    
    // MARK: - submitRating
    func submitRating()
    {
        Indicator.sharedInstance.showIndicator()
        let request = ChatRating.SubmitRating.Request(rating: ratingView.rating, comment: self.commentTextView.text)
        interactor?.submitRating(request: request)
    }
    
    func displaySubmitRating(viewModel: ChatRating.SubmitRating.ViewModel)
    {
        Indicator.sharedInstance.hideIndicator()
        let alert = UIAlertController(title: "🎉", message: "Session clôturé, merci pour votre retour", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            let presentingVC = self.presentingViewController as? UINavigationController
            self.dismiss(animated: true) {
                presentingVC?.popViewController(animated: true)
            }
        }))
        self.present(alert, animated: true)
    }
    
    func displaySubmitRatingError(viewModel: ChatRating.SubmitRating.ViewModel)
    {
        Indicator.sharedInstance.hideIndicator()
        let alert = UIAlertController(title: "😢", message: "Oups! un probleme est survenu réessayer plus tard !", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func submitRatingPressed(_ sender: Any) {
        self.submitRating()
    }
    
    
    @objc func keyboardWillAppear() {
        UIView.animate(withDuration: 0.5) {
            self.horizontalConstraint.constant = -140
            self.view.layoutIfNeeded()
        }
    }

    @objc func keyboardWillDisappear() {
        UIView.animate(withDuration: 0.5) {
            self.horizontalConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func handleBgViewTap(_ sender: UITapGestureRecognizer? = nil) {
        if self.horizontalConstraint.constant == -140 {
            self.view.endEditing(true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
