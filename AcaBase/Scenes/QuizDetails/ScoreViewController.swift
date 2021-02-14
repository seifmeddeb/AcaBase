//
//  ScoreViewController.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 1/3/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var ScoreLbl: UILabel!
    @IBOutlet weak var progressView: GradientArcView!
    
    var score = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.ScoreLbl.text = "\(score)/\(total)"
        
    }

    override func viewDidAppear(_ animated: Bool) {
        self.progressView.setValue(self.score, self.total, isAnimated: true)
    }
    
    @IBAction func reviewPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func checkQuizsPressed(_ sender: Any) {
        let presentingVC = self.presentingViewController as? UINavigationController
        self.dismiss(animated: true) {
            presentingVC?.popViewController(animated: true)
        }
    }
}
