//
//  ViewController.swift
//  Calculator
//
//  Created by Ryan Anderson on 4/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    var stringDisplay : [Int] = []
    
    private var isFinishedtypingNumber: Bool = true
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedtypingNumber = true
    
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
