//
//  LessonHeaderView.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/23/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class LessonHeaderView: UITableViewHeaderFooterView {

    // MARK: Outlets
    @IBOutlet weak var videosBtn: UIButton!
    @IBOutlet weak var quizBtn: UIButton!
    @IBOutlet weak var progressView: GradientArcView!
    @IBOutlet weak var progressLbl: UILabel!
    
    // Properties
    private var didSelectVideos: (() ->Void)?
    private var didSelectQuizs: (() ->Void)?
    
    
    @discardableResult
    func didSelectVideos(_ completion: (()->Void)?) ->Self {
        self.didSelectVideos = completion
        return self
    }
    
    @discardableResult
    func didSelectQuizs(_ completion: (()->Void)?) ->Self {
        self.didSelectQuizs = completion
        return self
    }
    
    // MARK: IBActions
    @IBAction func videosPressed(_ sender: Any) {
        self.didSelectVideos?()
        updateUIForSelection(isVideos: true)
    }
    @IBAction func quizPressed(_ sender: Any) {
        self.didSelectQuizs?()
        updateUIForSelection(isVideos: false)
    }
    
    @IBAction func startTestPressed(_ sender: Any) {
    }
    
    func setHeader(progress: Int, total: Int){
        self.progressView.setValue(progress, total)
        self.progressLbl.text = "\(progress)/\(total)"
        self.progressView.setNeedsLayout()
    }
    
    // MARK: Private Funcs
    
    private func updateUIForSelection(isVideos: Bool) {
        if isVideos {
            videosBtn.backgroundColor = .white
            videosBtn.setTitleColor(primaryBlue, for: .normal)
            
            quizBtn.backgroundColor = .clear
            quizBtn.setTitleColor(.white, for: .normal)
            
            videosBtn.isUserInteractionEnabled = false
            quizBtn.isUserInteractionEnabled = true
        } else {
            videosBtn.backgroundColor = .clear
            videosBtn.setTitleColor(.white, for: .normal)
            
            quizBtn.backgroundColor = .white
            quizBtn.setTitleColor(primaryBlue, for: .normal)
            
            videosBtn.isUserInteractionEnabled = true
            quizBtn.isUserInteractionEnabled = false
        }
    }
}
