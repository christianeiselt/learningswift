//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Christian Eiselt on 09.07.20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var result: Double?
    var tipPercentage: Int?
    var numberOfPeople: Int?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", result ?? "0.00")
        settingsLabel.text = "Split between \(numberOfPeople ?? 2) people, with \(tipPercentage ?? 10)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
