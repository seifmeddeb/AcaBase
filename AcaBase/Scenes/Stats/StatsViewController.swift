//
//  StatsViewController.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 25/9/2021.
//  Copyright (c) 2021 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StatsDisplayLogic: class
{
    func displayStats(viewModel: Stats.Fetch.ViewModel)
    func displayStatsError(viewModel: Stats.Fetch.ViewModel)
}

class StatsViewController: UIViewController, StatsDisplayLogic
{
    var interactor: StatsBusinessLogic?
    var router: (NSObjectProtocol & StatsRoutingLogic & StatsDataPassing)?
    
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
        let interactor = StatsInteractor()
        let presenter = StatsPresenter()
        let router = StatsRouter()
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
        fetchStats()
        
        let filters = ["Par Jour":0,"Par Matière":1]
        self.setStatsFilter(filters: filters)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        setNavBarWhenAppearing()
    }
    
    // MARK: properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedHolderView: UIView!
    var statsList = [StatCellType]()
    var chartIndex = 0
    
    // MARK: Segmented control changed
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        self.chartIndex = sender.selectedSegmentIndex
        self.collectionView.reloadData()
    }
    
    // MARK: fetchStats
    func fetchStats()
    {
        Indicator.sharedInstance.showIndicator()
        let request = Stats.Fetch.Request()
        interactor?.fetchStats(request: request)
    }
    
    func displayStats(viewModel: Stats.Fetch.ViewModel)
    {
        Indicator.sharedInstance.hideIndicator()
        self.statsList = viewModel.statList ?? [StatCellType]()
        self.collectionView.reloadData()
    }
    
    func displayStatsError(viewModel: Stats.Fetch.ViewModel)
    {
        Indicator.sharedInstance.hideIndicator()
        let alert = UIAlertController(title: "Oups 😥", message: viewModel.errorMsg ?? "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
}
extension StatsViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if statsList.count > 0 {
            if section == 0 {
                return 1
            } else {
                return 4
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var item = statsList[indexPath.row]
        
        if indexPath.section == 0 {
            item = statsList[0]
        } else {
            item = statsList[indexPath.row+1]
        }
        
        switch item {
        case .chart(let item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderStatCell", for: indexPath) as! HeaderStatCell
            
            cell.setup(viewModel: item, index: self.chartIndex)
            return cell
        case .stat(let item):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatCell", for: indexPath) as! StatCell
            
            cell.setup(viewModel: item)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.5)
        } else {
            return CGSize(width: (collectionView.frame.width/2) - 5.0 , height: collectionView.frame.height * 0.3)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets.init(top: .zero, left: .zero, bottom: 20.0, right: .zero)
        }
        return UIEdgeInsets.zero
    }
    
}
