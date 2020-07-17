//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Christian Eiselt on 09.07.20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {

    var bmi: BMI?
    
    func getBMIValue() -> String
    {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }

    mutating func calculateBMI(h height: Float, w weight: Float)
    {
        let bmiValue = weight / pow(height,2)
  
        if bmiValue < 18.5
        {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
        else if bmiValue < 24.9
        {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        }
        else
        {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        }
    }
    
    func getAdvice() -> String
    {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor
    {
        return bmi?.color ?? #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
}
