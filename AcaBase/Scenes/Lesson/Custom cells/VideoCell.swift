//
//  VideoCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/22/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var viewsLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setVideo(viewModel: VideoAlias) {
        if let url = viewModel.url {
            self.thumbnail.setVideoThumbnail(from: url)
        }
        self.titleLbl.text = viewModel.title
        self.viewsLbl.text = viewModel.views
        self.timeLbl.text = viewModel.time
    }
}
