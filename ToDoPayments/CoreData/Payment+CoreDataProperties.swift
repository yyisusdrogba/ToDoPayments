//
//  Payment+CoreDataProperties.swift
//  ToDoPayments
//
//  Created by Jesus Gonzalez on 25/11/24.
//
//

import Foundation
import CoreData


extension Payment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Payment> {
        return NSFetchRequest<Payment>(entityName: "Payment")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: String?
    @NSManaged public var date: String?
    @NSManaged public var category: String?
    @NSManaged public var image: String?
    @NSManaged public var payForPerson: String?

}

extension Payment : Identifiable {

}
