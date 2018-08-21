//
//  Calc.swift
//  SimpleCalc
//
//  Created by Lucas Andrade on 8/19/18.
//  Copyright © 2018 LukeGurgel. All rights reserved.
//

import Foundation

struct Calc {
    
    // MARK: Properties
    
    private var acc: Double?
    private var pendingBinaryOp: PendingBinaryOp?
    
    var result: Double? {
        get {
            return acc
        }
    }
    
    private enum Op {
        case constant(Double)
        case unaryOp((Double) -> Double)
        case binaryOp((Double, Double) -> Double)
        case equals
        case clear
    }
    
    private var ops: Dictionary<String, Op> = [
        "π":    Op.constant(Double.pi),
        "e":    Op.constant(M_E),
        "√":    Op.unaryOp(sqrt),
        "cos":  Op.unaryOp(cos),
        "+-":   Op.unaryOp({ -$0 }),
        "*":    Op.binaryOp({ $0 * $1 }),
        "/":    Op.binaryOp({ $0 / $1 }),
        "+":    Op.binaryOp({ $0 + $1 }),
        "-":    Op.binaryOp({ $0 - $1 }),
        "=":    Op.equals,
        "C":    Op.clear
    ]
    
    private struct PendingBinaryOp {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        func perform(with secOperand: Double) -> Double {
            return function(firstOperand, secOperand)
        }
    }
    
    // MARK: Methods
    
    mutating func performOp(_ symbol: String) {
        if let op = ops[symbol] {
            switch op {
                case .constant(let value):
                    acc = value
                case .unaryOp(let function):
                    if let operand = acc {
                        acc = function(operand)
                    }
                case .binaryOp(let function):
                    if let operand = acc {
                        pendingBinaryOp = PendingBinaryOp(function: function, firstOperand: operand)
                        acc = nil
                    }
                case .equals:
                    performPendingBinaryOp()
                case .clear:
                    clear()
            }
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        acc = operand
    }
    
    mutating private func performPendingBinaryOp() {
        if let operand = acc {
            acc = pendingBinaryOp?.perform(with: operand)
            pendingBinaryOp = nil
        }
    }
    
    mutating private func clear() {
        acc = 0
        pendingBinaryOp = nil
    }
    
}






