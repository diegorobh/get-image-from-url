//
//  ViewController.swift
//  Summary
//
//  Created by diego paredes on 21/10/19.
//  Copyright © 2019 Wilman Rojas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func summaryActionBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToSummary", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

