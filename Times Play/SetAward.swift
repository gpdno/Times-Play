//
//  SetImage.swift
//  Times Play
//
//  Created by Gregory DeNinno on 1/22/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import UIKit

class SetAward {
    
    var assetName: String = ""
    
    func GetImage(someValue: Int)->UIImage {
        
        switch someValue {
        case 100:
            assetName = "gold medal"
        case 80...99:
            assetName = "silver medal"
        case 60...79:
            assetName = "bronze medal"
        default:
            assetName = "ribbon"
        }
        
        //Return an image constructed from what existed in my images folder based on logic above
        return UIImage(named: (assetName))!
        
    }
    
}