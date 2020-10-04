//
//  TutorModels.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/27/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Tutor
{
  // MARK: Use cases
  
  enum Display
  {
    struct Request
    {
    }
    struct Response
    {
        var tutor : TutorDAO!
    }
    struct ViewModel
    {
        var tutor : TutorDAO!
        var pictureUrl : URL?
        var subjects : String!
    }
  }
}
