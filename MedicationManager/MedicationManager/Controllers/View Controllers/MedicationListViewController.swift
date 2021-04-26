//
//  MedicationListViewController.swift
//  MedicationManager
//
//  Created by Cynthia Nikolai on 4/26/21.
//

import UIKit

class MedicationListViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        MedicationController.sharedInstance.fetchMedications()
    }
    
    // MARK:- Actions
    
    
    // MARK:- Functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       //IIDOO
        if segue.identifier == "toEditMedication" {
            guard let destinationVC = segue.destination as? MedicationDetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else { return }
            let medication = MedicationController.sharedInstance.medications[indexPath.row]
            destinationVC.medication = medication
        }
    }
}

// MARK:-Extensions
extension MedicationListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MedicationController.sharedInstance.medications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "medicationCell") as? MedicationTableViewCell else { return UITableViewCell() }
        
        let medication = MedicationController.sharedInstance.medications[indexPath.row]
        
        cell.configure(with: medication)
        
        
        return cell
    }
    
    
}
