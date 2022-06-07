//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Ryan Anderson on 6/6/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {

        switch symbol {

        case ("+/-"):
            return number * -1

        case ("AC"):
            return 0

        case ("%"):
            return number * 0.01

        default:
            print("Error with \(symbol) Button")
        }
        return nil
    }
}
