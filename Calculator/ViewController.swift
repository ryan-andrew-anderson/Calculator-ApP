//
//  ViewController.swift
//  Calculator
//
//  Created by Ryan Anderson on 4/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a double")
            }
            return number
        }
        
        set {
            
        }
        
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {

        guard let calcMethod = sender.currentTitle else { return }
        
        isFinishedTypingNumber = true

        switch calcMethod {
            
        case ("+/-"):
            displayLabel.text = String(displayValue * -1)
            
        case ("AC"):
            displayLabel.text = "0"
            
        case ("%"):
            displayLabel.text = String(displayValue/100)
            
        default:
            print("Error with \(calcMethod) Button")
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if var numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                if numValue == "." {
                    numValue = "0."
                }
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                    if displayLabel.text?.last == "." && numValue == "." {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
