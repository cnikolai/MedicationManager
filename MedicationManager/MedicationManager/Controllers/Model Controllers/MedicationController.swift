//
//  MedicationController.swift
//  MedicationManager
//
//  Created by Cynthia Nikolai on 4/26/21.
//

import CoreData

class MedicationController {
    // MARK:- Properties
    static let sharedInstance = MedicationController()
    var medications: [Medication] = []
    
    private lazy var fetchRequest: NSFetchRequest<Medication> = {
       let request = NSFetchRequest<Medication>(entityName: "Medication")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {
        
    }
    
    // MARK:- Functions
    // CRUD
    // create
    func createMedication(name: String, timeOfDay: Date) {
        let medication = Medication.init(name: name, timeOfDay: timeOfDay)
        medications.append(medication)
        //save
        CoreDataStack.saveContext()
    }
    
    // read
    func fetchMedications() {
        let medications = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(medications.count)
        self.medications = medications
    }
    
    // update
    func updateMedication(_ medication: Medication) {
        CoreDataStack.saveContext()
    }
    
    // delete
    func deleteMedication() {
        //TODO Tomorrow
    }
}
