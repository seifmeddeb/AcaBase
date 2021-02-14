//
//  PracticeCell.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 11/28/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import UIKit

class PracticeCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var progressView: GradientArcView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var noChaptersView: UIView!
    var chapterList = [ChapterDAO]()
    // Properties
    private var didSelectChapter: ((ChapterDAO) ->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.register(ChapterCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @discardableResult
    func didSelectChapter(_ completion: ((ChapterDAO)->Void)?) ->Self {
        self.didSelectChapter = completion
        return self
    }
    
    func setModule(viewModel: ModuleViewModel) {
        self.titleLabel.text = viewModel.model.model.title
        self.descLabel.text = viewModel.desc
        self.progressLabel.text = "1/\(viewModel.quizsNbr)"
        self.progressView.setValue(1, viewModel.quizsNbr > 0 ? viewModel.quizsNbr : 5)
        self.progressView.setNeedsLayout()
        self.chapterList = viewModel.model.model.chapters ?? [ChapterDAO]()
        self.noChaptersView.isHidden = (chapterList.count != 0)
        self.collectionView.reloadData()
    }
}

extension PracticeCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chapterList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChapterCell", for: indexPath) as! ChapterCell
        cell.setChapter(viewModel: chapterList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 150.0, height: 100.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedChapter = chapterList[indexPath.row]
        self.didSelectChapter?(selectedChapter)
    }
    
}
