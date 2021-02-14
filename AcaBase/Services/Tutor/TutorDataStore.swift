//
//  TutorDataStore.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 1/24/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation

class TutorCoreDataStore : TutorStoreProtocol {
    
    lazy var moc = {
        CoreDataStore.persistentContainer.viewContext
    }()
    
    func addToFavorites(request: FavoriteRequest, completionHandler: @escaping (() throws -> FavoriteResponse  ) -> Void) {
        
    }
}
