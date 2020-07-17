//
//  SplitBrain.swift
//  Tipsy
//
//  Created by Christian Eiselt on 13.07.20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct SplitBrain {
    
    let pcts: [Int: [Bool]] = [
        0: [true,false,false],
        10: [false,true,false],
        20: [false,false,true]
    ]

    var result: Double = 0.0
    var tip: Int = 10
    var numberOfPeople: Int = 2
    
    mutating func setPctTip(_ tipTxt: String)
    {
        let strArray = tipTxt.split(separator: "%")
        tip = Int(strArray[0]) ?? 0
    }
    
    func getTip() -> Int
    {
        return tip
    }
    
    func getSelected() -> [Bool]
    {
        return pcts[tip] ?? [false,true,false]
    }
    
    mutating func calculateResult(billText: String?,numberOfPeople: Int)
    {
        let bill = Double(billText ?? "0.0") ?? 0.0
        self.numberOfPeople = numberOfPeople

        result = bill * Double(1 + Double(tip)/100) / Double(numberOfPeople)
    }

    func getResult() -> Double
    {
        return result
    }

    func getNumberOfPeople() -> Int
    {
        return numberOfPeople
    }
}
