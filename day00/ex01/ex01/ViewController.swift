//
//  ViewController.swift
//  ex01
//
//  Created by Andriy Gordiychuk on 14/01/2019.
//  Copyright © 2019 agordiyc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label:UILabel!
    
    @IBAction func clickMe() {
        label.text = "Hello world !"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

