//
//  MedicationTableViewCell.swift
//  MedicationManager
//
//  Created by Cynthia Nikolai on 4/26/21.
//

import UIKit

class MedicationTableViewCell: UITableViewCell {

    // MARK:- Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dosageTimeLabel: UILabel!
    @IBOutlet weak var hasBeenTakenButton: UIButton!
    
    // MARK:- Actions
    @IBAction func hasBeenTakenButtonTapped(_ sender: Any) {
        print("HasBeenTakenButton Tapped")
    }
    
    // MARK:- Functions
    func configure(with medication: Medication) {
        titleLabel.text = medication.name
        //dosageTimeLabel.text = DateFormatter.medicationTime.string(from: medication.timeOfDay ?? Date)
        dosageTimeLabel.text = medication.timeOfDay?.formatToString()
    }
    

}//end of class
