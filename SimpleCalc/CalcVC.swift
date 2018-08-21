//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Lucas Andrade on 8/19/18.
//  Copyright © 2018 LukeGurgel. All rights reserved.
//

import UIKit

class CalcVC: UIViewController {

    // MARK: Properties
    
    private var calc = Calc()
    var isTyping = false
    var displayVal: Double {
        get {
            return Double(displayLbl.text!)!
        }
        set {
            displayLbl.text = String(newValue)
        }
    }
    
    // MARK: UI Elements
    
    @IBOutlet weak var displayLbl: PaddedLbl!
    
    // MARK: Actions

    @IBAction func tapDigit(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        if isTyping {
            if let currentText = displayLbl.text {
                displayLbl.text = currentText + digit
            }
        } else {
            displayLbl.text = digit
            isTyping = true
        }
    }
    
    @IBAction func performOp(_ sender: UIButton) {
        if isTyping {
            calc.setOperand(displayVal)
            isTyping = false
        }
        if let symbol = sender.currentTitle {
            calc.performOp(symbol)
        }
        if let result = calc.result {
            displayVal = result
        }
    }
    
}









