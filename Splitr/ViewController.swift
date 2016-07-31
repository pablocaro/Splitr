//
//  ViewController.swift
//  Splitr
//
//  Created by Pablo Caro on 7/31/16.
//  Copyright © 2016 Pablo Caro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipControl.alpha = 0
        tipControl.center.y = 305
        var editing = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dismiss(sender: AnyObject) {
              view.endEditing(true)
    }

    
    @IBAction func showTipControl(sender: AnyObject) {
        
        
        
        if editing == false {
            
            UIView.animateWithDuration(0.4, animations: {
                self.tipControl.alpha = 1
                self.tipControl.center.y = 295
                
            })
            
            editing = true
        }
    
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        tipLabel.text = String(format: "%.2f",tip)
        totalLabel.text = String(format: "%.2f",total)
        
        
        
    }
}

