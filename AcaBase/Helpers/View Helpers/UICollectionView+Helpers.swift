//
//  UICollectionView+Helpers.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 3/5/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import UIKit

extension UIScrollView {
  
  var isAtBottom: Bool {
    return contentOffset.y >= verticalOffsetForBottom
  }
  
  var verticalOffsetForBottom: CGFloat {
    let scrollViewHeight = bounds.height
    let scrollContentSizeHeight = contentSize.height
    let bottomInset = contentInset.bottom
    let scrollViewBottomOffset = scrollContentSizeHeight + bottomInset - scrollViewHeight
    return scrollViewBottomOffset
  }
  
}
