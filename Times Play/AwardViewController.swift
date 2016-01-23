//
//  AwardViewController.swift
//  Times Play
//
//  Created by Gregory DeNinno on 1/22/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import UIKit

class AwardViewController: UIViewController {
    
    var passedNumberOfRounds = Int()
    var passedNumberCorrect = Int()
    
    let image = SetAward()
    var percent = Int()
    
    @IBOutlet var finalScoreText: UILabel!
    
    @IBOutlet var awardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        percent = Int(Double(passedNumberCorrect) / Double(passedNumberOfRounds) * 100)

        finalScoreText.text = "\(percent)%"
        
        awardImage.image = image.GetImage(percent)
        
    }
       
    @IBAction func homeButtonPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("backToPlay", sender: self)
    }
    
}


