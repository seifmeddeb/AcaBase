//
//  LessonViewController.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/21/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LessonDisplayLogic: class
{
    func displayChapter(viewModel: Lesson.Chapter.ViewModel)
    func displayVideos(viewModel: Lesson.Videos.ViewModel)
    func displayQuizs(viewModel: Lesson.Quizs.ViewModel)
}

class LessonViewController: UIViewController, LessonDisplayLogic
{
    var interactor: LessonBusinessLogic?
    var router: (NSObjectProtocol & LessonRoutingLogic & LessonDataPassing)?
    
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
        let interactor = LessonInteractor()
        let presenter = LessonPresenter()
        let router = LessonRouter()
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
        tableView.register(LessonHeaderView.self)
        tableView.register(VideoCell.self)
        tableView.register(QuizCell.self)
        getChapter()
        getVideos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        setNormalNavBarWhenAppearing()
    }
    
    // MARK: Properties
    
    var items = [Lesson.CellType]()
    var selectedQuiz : QuizDAO?
    var selectedVideo : VideoAlias?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressView: GradientArcView!
    @IBOutlet weak var progressTestLbl: UILabel!
    
    // MARK: getChapter
    
    func getChapter()
    {
        let request = Lesson.Chapter.Request()
        interactor?.getChapter(request: request)
    }
    func displayChapter(viewModel: Lesson.Chapter.ViewModel) {
        self.title = viewModel.title
    }
    
    // MARK: getVideos
    
    func getVideos()
    {
        let request = Lesson.Videos.Request()
        interactor?.getVideos(request: request)
    }
    
    func displayVideos(viewModel: Lesson.Videos.ViewModel)
    {
        self.items = viewModel.videoList
        self.tableView.reloadData()
    }
    
    // MARK: getQuizs
    
    func getQuizs()
    {
        let request = Lesson.Quizs.Request()
        interactor?.getQuizs(request: request)
    }
    
    func displayQuizs(viewModel: Lesson.Quizs.ViewModel)
    {
        self.items = viewModel.quizList
        self.tableView.reloadData()
    }
    
    // MARK: IBActions
    @IBAction func startTestPressed(_ sender: Any) {
    }
    
}
extension LessonViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .video(let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
            cell.setVideo(viewModel: viewModel)
            return cell
        case .quiz(let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath) as! QuizCell
            cell.setCell(with: viewModel)
            //cell.progressView.setProgress(progress: "1/4")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "LessonHeaderView") as! LessonHeaderView
        view.setHeader(progress: 3, total: 4)
        view.didSelectQuizs {
            self.getQuizs()
        }
        view.didSelectVideos {
            self.getVideos()
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        switch item {
        case .video(let viewModel):
            self.selectedVideo = viewModel
            self.router?.routeToVideoDetails(segue: nil)
        case .quiz(let viewModel):
            self.selectedQuiz = viewModel.model
            self.router?.routeToDetailQuiz(segue: nil)
        }
    }
    
}
