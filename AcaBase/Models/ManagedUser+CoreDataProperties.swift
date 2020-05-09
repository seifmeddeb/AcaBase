//
//  ManagedUser+CoreDataProperties.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/3/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//
//

import Foundation
import CoreData


extension ManagedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedUser> {
        return NSFetchRequest<ManagedUser>(entityName: "ManagedUser")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var phone: String?
    @NSManaged public var email: String?

}
