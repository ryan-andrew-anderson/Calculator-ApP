//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Ryan Anderson on 6/6/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import UIKit

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (firstNumber: Double, calculationMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        guard let n = number else { return nil }
        
        switch symbol {
            
        case ("+/-"):
            return n * -1
            
        case ("AC"):
            return 0
            
        case ("%"):
            return n * 0.01
            
        case ("="):
            return performTwoNumCaculation(n2: n)
            
        default:
            intermediateCalculation = (firstNumber: n, calculationMethod: symbol)
        }
        return nil
    }
    
    private func performTwoNumCaculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.firstNumber, let operation = intermediateCalculation?.calculationMethod {
            
            switch operation {
                
            case ("+"):
                return n1 + n2
            case ("÷"):
                return n1 / n2
            case ("×"):
                return n1 * n2
            case ("-"):
                return n1 - n2
                
            default:
                fatalError("the operation does not match any of the caes")
            }
        }
        return nil
        
    }
}
