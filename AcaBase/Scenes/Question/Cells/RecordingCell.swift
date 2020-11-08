//
//  RecordingCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 11/2/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class RecordingCell: UITableViewCell {

    @IBOutlet weak var playStopBtn: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    // Properties
    private var didPressDelete: (() ->Void)?
    private var didPressPlay: (() ->Void)?
    var attachement :Attachement?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(viewModel: Attachement){
        self.attachement = viewModel
        self.nameLbl.text = viewModel.name
        self.sizeLbl.text = viewModel.size
        self.playStopBtn.setImage(UIImage(named: "baseline_play_arrow_black_24pt"), for: .normal)
    }
    
    @discardableResult
    func didPressDelete(_ completion: (()->Void)?) ->Self {
        self.didPressDelete = completion
        return self
    }
    
    @discardableResult
    func didPressPlay(_ completion: (()->Void)?) ->Self {
        self.didPressPlay = completion
        return self
    }

    @IBAction func deletePressed(_ sender: Any) {
        self.didPressDelete?()
    }
    @IBAction func playStopPressed(_ sender: Any) {

        let playImage = UIImage(named: "baseline_play_arrow_black_24pt")
        if self.playStopBtn.currentImage == playImage {
        self.playStopBtn.setImage(UIImage(named: "baseline_stop_black_24pt"), for: .normal)
        } else {
        self.playStopBtn.setImage(playImage, for: .normal)
        }
        self.didPressPlay?()
    }
    
}
