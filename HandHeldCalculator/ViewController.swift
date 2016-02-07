//
//  ViewController.swift
//  HandHeldCalculator
//
//  Created by Abby Juan on 1/28/16.
//  Copyright © 2016 ZhanLiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   var firstNumber = Float()
   var secondNumber = Float()
   var isTypingNumber = false
   var result = Float()
   var operation = ""
    
   
    
    
    
    @IBOutlet var buttons: [UIButton]!
  
    
    @IBAction func dotButton(sender: AnyObject) {
    var dot = sender.currentTitle
    screenLabel.text = screenLabel.text! + dot!!
        
    }
    @IBOutlet weak var screenLabel: UILabel!
    
    @IBAction func numbersButton(sender: AnyObject) {
    
    
        
        var number = sender.currentTitle
        if isTypingNumber == true {
            
        screenLabel.text = screenLabel.text! + number!!
    } else {
        screenLabel.text = number
    }
    isTypingNumber = true
    
    
    }
    
    @IBAction func operationsButton(sender: AnyObject) {
        operation = sender.currentTitle!!
        isTypingNumber = false
        firstNumber = (screenLabel.text! as NSString).floatValue
    }
    
    @IBAction func equalsButton(sender: AnyObject) {
        
        secondNumber = (screenLabel.text! as NSString).floatValue
        if operation == "+" {
            result = firstNumber + secondNumber
        }else if operation == "-" {
            result = firstNumber - secondNumber
        }else if operation == "X" {
            result = firstNumber * secondNumber
        }else if operation == "/" {
            result = firstNumber / secondNumber
        }else if operation == "%" {
            result = (firstNumber * secondNumber) / 100
        }else  {
            result = sqrt(firstNumber)
        }
        screenLabel.text = "\(result)"
    }
    
    @IBAction func clearButton(sender: AnyObject) {
        
        firstNumber = 0
        secondNumber = 0
        isTypingNumber = false
        result = 0
        screenLabel.text = "\(result)"
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        self.navigationItem.title = "Calculator"
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.setBackgroundImage(UIImage(named: "calculatoricon1"), forBarMetrics: .Default)
            navigationBar.tintColor = UIColor(red: 1.0, green: 0.25, blue: 0.25, alpha: 0.8)
            
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
            shadow.shadowOffset = CGSizeMake(2, 2);
            shadow.shadowBlurRadius = 4;
            navigationBar.titleTextAttributes = [
                NSFontAttributeName : UIFont.boldSystemFontOfSize(22),
                NSForegroundColorAttributeName : UIColor(red: 0.15, green: 0.15, blue: 0.50, alpha: 0.8),
                NSShadowAttributeName : shadow
            ]
        }
    
        for button in buttons {
            button.showsTouchWhenHighlighted = true
        }
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

