//
//  Medication+Convenience.swift
//  MedicationManager
//
//  Created by Cynthia Nikolai on 4/26/21.
//

import CoreData

extension Medication {
    @discardableResult convenience init(name: String, timeOfDay: Date, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.timeOfDay = timeOfDay
    }
}
