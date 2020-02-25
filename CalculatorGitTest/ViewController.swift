//
//  ViewController.swift
//  CalculatorGitTest
//
//  Created by  LeiZ on 2020/2/22.
//  Copyright © 2020  LeiZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dispaly: UILabel!
    var userIsInTheMiddleOfTyping = false
    var dispalyValue: Double {
        get{
            return Double(dispaly.text!)!
        }set{
            dispaly.text = String(newValue)
        }
    }
    
    @IBAction func touchDIgit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyInDisplay = dispaly.text!
            dispaly.text = textCurrentlyInDisplay + digit
        }else{
            dispaly.text = digit
            userIsInTheMiddleOfTyping = true
        }
//        这一部分的逻辑是，当数字按下时，因为userIsInTheMiddleOfTyping是false，所以执行  dispaly.text = digit 所以display显示你按下的数字，与此同时改变userIsInTheMiddleOfTyping为true，所以当digit再次按下时会执行 let textCurrentlyInDisplay = dispaly.text! dispaly.text = textCurrentlyInDisplay + digit，所以display会显示所有你按下的数字
      
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }

    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathmaticalSymbol = sender.currentTitle{
            switch mathmaticalSymbol {
            case "π":
                dispalyValue = Double.pi
                
            case "√":
               dispalyValue = sqrt(dispalyValue)
            default:
                dispaly.text = "0"
            }
            
        }
    }
    
}

