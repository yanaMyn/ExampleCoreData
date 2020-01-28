//
//  User+CoreDataProperties.swift
//  ExampleCoreData
//
//  Created by yana mulyana on 28/01/20.
//  Copyright © 2020 LinkAJa. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16

}
