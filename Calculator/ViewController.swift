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
            let number = Double(displayLabel.text!),
            let calcMethod = sender.currentTitle
        else { fatalError("Cannotconvert display label text to a double") }
        
        switch calcMethod {
            
        case ("+/-"):
            displayLabel.text = String(-number)
            print(number)
            
        case ("AC"):
            displayLabel.text = "0"
            print(number)
            
        case ("%"):
            displayLabel.text = String(number/10)
            print(number)
            
        default:
            print("Error with \(calcMethod) Button")
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedtypingNumber {
                displayLabel.text = numValue
                isFinishedtypingNumber = false
            } else {
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
