//
//  MedicationDetailViewController.swift
//  MedicationManager
//
//  Created by Cynthia Nikolai on 4/26/21.
//

import UIKit

class MedicationDetailViewController: UIViewController {

    // MARK:- Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK:- Properties
    var medication: Medication?
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    // MARK:- Actions
    @IBAction func saveMedicationButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        if let medication = medication {
            medication.name = name
            medication.timeOfDay = datePicker.date
            MedicationController.sharedInstance.updateMedication(medication)
        } else {
            MedicationController.sharedInstance.createMedication(name: name, timeOfDay: datePicker.date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK:- Functions
    func updateView() {
        guard let medication = medication else { return }
        nameTextField.text = medication.name
        datePicker.date = medication.timeOfDay ?? Date()
    }
}
