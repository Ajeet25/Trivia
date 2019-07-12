//
//  UserDetails+CoreDataProperties.swift
//  TrivaDemo
//
//  Created by kushal on 09/07/19.
//  Copyright © 2019 ajeet. All rights reserved.
//
//

import Foundation
import CoreData


extension UserDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDetails> {
        return NSFetchRequest<UserDetails>(entityName: "UserDetails")
    }

    @NSManaged public var first_answer: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var second_answer: String?
    @NSManaged public var date: String?

}
