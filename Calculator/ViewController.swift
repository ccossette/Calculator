//
//  ViewController.swift
//  Calculator
//
//  Created by Carlo Cossette on 2015-05-14.
//  Copyright (c) 2015 Carlo Cossette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
        display.text = display.text! + digit
        } else {
        display.text = digit
        userIsInTheMiddleOfTypingANumber = true
        }
        
    }

    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle{
            if let result = brain.performOperation(operation){
                displayValue = result
            } else {
                displayValue = 0
            }
        }
        
    }
    
    
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue        }
        set {
        display.text = "\(newValue)"
            //userIsInTheMiddleOfTypingANumber = false
        }
    }
}

