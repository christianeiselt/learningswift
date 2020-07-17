//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var splitBrain = SplitBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)

        splitBrain.setPctTip(sender.currentTitle!)

        highlightTipPercentage()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billStr = billTextField.text //?? "0.0"
        let numberOfPeople = Int(splitNumberLabel.text ?? "2") ?? 2

        splitBrain.calculateResult(billText: billStr, numberOfPeople: numberOfPeople)
    }

    func highlightTipPercentage()
    {
        let selected: [Bool] = splitBrain.getSelected()
        
        zeroPctButton.isSelected = selected[0]
        tenPctButton.isSelected = selected[1]
        twentyPctButton.isSelected = selected[2]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"
        {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = splitBrain.getResult()
            destinationVC.tipPercentage = splitBrain.getTip()
            destinationVC.numberOfPeople = splitBrain.getNumberOfPeople()
        }
    }
}

