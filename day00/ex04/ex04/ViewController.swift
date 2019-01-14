//
//  ViewController.swift
//  ex02
//
//  Created by Andriy Gordiychuk on 14/01/2019.
//  Copyright © 2019 agordiyc. All rights reserved.
//

import UIKit

enum OpType {
    case mult
    case add
    case sub
    case div
    case none
}

class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    @IBOutlet var lastButton: UIButton?
    var currentRes = 0
    var initialState = true
    var lastOp:OpType = .none
    var isNaN = false {
        didSet {
            if isNaN {
                label.text = "Not a number"
            }
        }
    }
    var secondNum = 0
    
    @IBAction func mult(sender: UIButton) {
        print("Pressed *")
        calculate(force: false)
        highlightNewButton(new: sender)
        lastOp = .mult
        initialState = true
    }
    
    @IBAction func add(sender: UIButton) {
        print("Pressed +")
        calculate(force: false)
        highlightNewButton(new: sender)
        lastOp = .add
        initialState = true
    }
    
    @IBAction func sub(sender: UIButton) {
        print("Pressed -")
        calculate(force: false)
        highlightNewButton(new: sender)
        lastOp = .sub
        initialState = true
    }
    
    @IBAction func div(sender: UIButton) {
        print("Pressed /")
        calculate(force: false)
        highlightNewButton(new: sender)
        lastOp = .div
        initialState = true
    }
    
    @IBAction func res() {
        print("Pressed =")
        calculate(force: true)
        clearHighglight()
        initialState = true
    }
    
    @IBAction func ac() {
        print("Pressed AC")
        clearHighglight()
        initialState = true
        label.text = "0"
        lastOp = .none
        currentRes = 0
        isNaN = false
    }
    
    @IBAction func neg() {
        print("Pressed NEG")
        if isNaN {
            return
        }
        guard let text = label.text else {return}
        if Int(text) == 0 {
            return
        }
        if text.first == "-" {
            label.text = String(text[text.index(text.startIndex, offsetBy: 1)...])
        }
        else {
            label.text = "-\(text)"
        }
    }
    
    @IBAction func num(sender: UIButton) {
        print("Pressed \(sender.tag)")
        if initialState {
            label.text = "\(sender.tag)"
            initialState = false
        }
        else {
            label.text = "\(label.text ?? "")\(sender.tag)"
        }
    }
    
    func highlightNewButton(new: UIButton) {
        clearHighglight()
        new.backgroundColor = UIColor.white
        new.setTitleColor(UIColor(displayP3Red: 1, green: 0.5, blue: 0, alpha: 1.0), for: .normal)
        lastButton = new
    }
    
    func clearHighglight() {
        if let last = lastButton {
            last.backgroundColor = UIColor(displayP3Red: 1, green: 0.5, blue: 0, alpha: 1.0)
            last.setTitleColor(UIColor.white, for: .normal)
        }
        lastButton = nil
    }
    
    func calculate(force: Bool) {
        if isNaN || (initialState && !force) {
            if isNaN {
                label.text = "Not a number"
            }
            return
        }
        if (!(force && initialState)) {
            guard let num = Int(label.text!) else {
                isNaN = true
                return
            }
            secondNum = num
        }
        switch (lastOp) {
            
        case .none:
            currentRes = secondNum
            break
            
        case .add:
            currentRes &+= secondNum
            break
            
        case .sub:
            currentRes &-= secondNum
            break
            
        case .mult:
            currentRes &*= secondNum
            break
            
        case .div:
            if secondNum == 0 {
                isNaN = true
                return
            }
            currentRes /= secondNum
            break
            
        }
        label.text = "\(currentRes)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

