//
//  ViewController.swift
//  Times Play
//
//  Created by Gregory DeNinno on 1/19/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIPopoverPresentationControllerDelegate {
    
    var randomStatus = Int()
    
    var multiplicationFactor = "1"
    
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var segmentControl: UISegmentedControl!
    
    @IBAction func factorSegmentSelect(sender: UISegmentedControl) {
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            randomStatus = 0
        case 1:
            randomStatus = 1
        default:
            randomStatus = 2
        }
    }
    @IBAction func inOrder(sender: AnyObject) {
        self.performSegueWithIdentifier("inOrderPopover", sender: self)
    }
    
    @IBAction func random15(sender: AnyObject) {
        self.performSegueWithIdentifier("random15Popover", sender: self)
    }
    
    @IBAction func random20(sender: AnyObject) {
        
        self.performSegueWithIdentifier("random20Popover", sender: self)
    }
    
    @IBAction func playButtonPressed(sender: AnyObject) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self

    }
    
    let pickerData = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve"]
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Chalkboard SE", size: 14.0)!,NSForegroundColorAttributeName:UIColor.brownColor()])
        pickerView.backgroundColor = UIColor(colorLiteralRed: 125, green: 200, blue: 150, alpha: 0.6)
        pickerView.layer.cornerRadius = 10
        return myTitle
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let value = pickerData[row]
        
        switch value {
            
        case "One":
            multiplicationFactor = "1"
            
        case "Two":
            multiplicationFactor = "2"
            
        case "Three":
            multiplicationFactor = "3"
            
        case "Four":
            multiplicationFactor = "4"
            
        case "Five":
            multiplicationFactor = "5"
            
        case "Six":
            multiplicationFactor = "6"
            
        case "Seven":
            multiplicationFactor = "7"
            
        case "Eight":
            multiplicationFactor = "8"
            
        case "Nine":
            multiplicationFactor = "9"
            
        case "Ten":
            multiplicationFactor = "10"
            
        case "Eleven":
            multiplicationFactor = "11"
            
        default:
            multiplicationFactor = "12"
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "passToQuiz" {
            
            let secondViewController: QuizViewController = segue.destinationViewController as! QuizViewController
            
            secondViewController.passedMultiplicationNumber = multiplicationFactor
            secondViewController.passedRandomStatus = randomStatus
            
        } else {
            
            if segue.identifier == "inOrderPopover" {
                
                let vc = segue.destinationViewController
                
                let controller = vc.popoverPresentationController
                
                if controller != nil {
                    
                    controller?.delegate = self
                    
                }
            } else if segue.identifier == "random15Popover" {
                
                let vc = segue.destinationViewController
                
                let controller = vc.popoverPresentationController
                
                if controller != nil {
                    
                    controller?.delegate = self
                }
                
            } else if segue.identifier == "random20Popover" {
                
                let vc = segue.destinationViewController
                
                let controller = vc.popoverPresentationController
                
                if controller != nil {
                    
                    controller?.delegate = self
                }
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return .None
    }
}
