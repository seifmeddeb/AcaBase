//
//  OptionCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/27/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class OptionCell: UITableViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var correctView: UIView!
    @IBOutlet weak var wrongView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var imageForCell: UIImageView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    // Properties
    private var didSelectOption: (() ->Void)?
    private var viewModel : OptionItemAlias!
    private var question : QuestionDAO!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @discardableResult
    func didSelectOption(_ completion: (()->Void)?) ->Self {
        self.didSelectOption = completion
        return self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    fileprivate func setBackground(for viewModel: OptionItemAlias) {
        switch viewModel.state {
        case .Correct:
            self.parentView.backgroundColor = primaryGreen
            self.correctView.isHidden = false
            self.wrongView.isHidden = true
        case .Wrong:
            self.parentView.backgroundColor = primaryRed
            self.correctView.isHidden = true
            self.wrongView.isHidden = false
        case .Undefined:
            self.parentView.backgroundColor = lightGrey
            self.correctView.isHidden = true
            self.wrongView.isHidden = true
        case .none:
            self.parentView.backgroundColor = lightGrey
            self.correctView.isHidden = true
            self.wrongView.isHidden = true
        }
    }
    
    func setOption(with viewModel: OptionItemAlias, _ question: QuestionDAO){
        self.viewModel = viewModel
        self.question = question
        self.titleLbl.text = viewModel.title
        self.descLbl.text = viewModel.desc
        if let imageUrl = viewModel.imageUrl {
            self.imageForCell.setImageAsync(url: imageUrl)
            self.imageHeightConstraint.constant = 100
        } else {
            self.imageForCell.image = nil
            self.imageHeightConstraint.constant = 0
        }
        setBackground(for: viewModel)
    }
    
    @IBAction func optionPressed(_ sender: Any) {
        if !(self.viewModel.state?.isAnswered ?? false) && !self.question.state.isAnswered {
            self.parentView.backgroundColor = self.viewModel.isTrue ? primaryGreen : primaryRed
            self.correctView.isHidden = !self.viewModel.isTrue
            self.wrongView.isHidden = self.viewModel.isTrue
            self.viewModel.state = self.viewModel.isTrue ? .Correct : .Wrong
            self.didSelectOption?()
        }
    }
}
