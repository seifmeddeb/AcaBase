//
//  MainPageWorker.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/9/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

class MainPageWorker {
    
    var mainPageStore : MainPageStoreProtocol
    
    init(mainPageStore: MainPageStoreProtocol)
    {
      self.mainPageStore = mainPageStore
    }
}

protocol MainPageStoreProtocol {
    
    func fetchTrainers(completionHandler: @escaping (() throws -> [TutorDAO]) -> Void)
    func fetchTopics(completionHandler: @escaping (() throws -> [TopicDAO]) -> Void)
    
}
