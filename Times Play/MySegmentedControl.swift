//
//  MySegmentedControl.swift
//  Times Play
//
//  Created by Gregory DeNinno on 1/28/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import UIKit

class MySegmentedControl: UISegmentedControl {
    
    override func awakeFromNib() {

    layer.cornerRadius = 5.0
    layer.borderWidth = 1.0
    layer.borderColor = UIColor.grayColor().CGColor
    backgroundColor = UIColor(colorLiteralRed: 125, green: 200, blue: 150, alpha: 0.6)
    tintColor = UIColor.brownColor()
        
    }
}
