//
//  ViewController.swift
//  ex02
//
//  Created by Andriy Gordiychuk on 14/01/2019.
//  Copyright © 2019 agordiyc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    
    @IBAction func mult() {
        print("Pressed *")
    }
    
    @IBAction func add() {
        print("Pressed +")
    }
    
    @IBAction func sub() {
        print("Pressed -")
    }
    
    @IBAction func div() {
        print("Pressed /")
    }
    
    @IBAction func res() {
        print("Pressed =")
    }
    
    @IBAction func ac() {
        print("Pressed AC")
    }
    
    @IBAction func neg() {
        print("Pressed NEG")
    }
    
    @IBAction func num(sender: UIButton) {
        print("Pressed \(sender.tag)")
        if label.text == " " {
            label.text = "\(sender.tag)"
        }
        else {
            label.text = "\(label.text ?? "")\(sender.tag)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

