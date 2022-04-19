//
//  ViewController.swift
//  Calculator
//
//  Created by Ryan Anderson on 4/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedtypingNumber: Bool = true
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedtypingNumber = true
        
        guard
            var number = Double(displayLabel.text!),
            let calcMethod = sender.currentTitle
//                ,calcMethod.contains("..") == false
        else { fatalError("Cannotconvert display label text to a double") }
        
        switch calcMethod {
            
        case ("+/-"):
            displayLabel.text = String(number * -1)
            
        case ("AC"):
            displayLabel.text = "0"
//            number = 0
            
        case ("%"):
            displayLabel.text = String(number/100)
            
        default:
            print("Error with \(calcMethod) Button")
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
//        if displayLabel.text?.contains("..") == true {
//            print("invald input")
//        }
        
        if let numValue = sender.currentTitle {
            
            if isFinishedtypingNumber {
                displayLabel.text = numValue
                isFinishedtypingNumber = false
            } else {
                if numValue == "." {
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("cannot display label text to a Double")
                    }
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
