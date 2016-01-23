//
//  SetImage.swift
//  Times Play
//
//  Created by Gregory DeNinno on 1/22/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import UIKit

class SetImage {
    
    var assetName: String = ""
    
    func GetImage(someValue: Int)->UIImage {
        
        switch someValue {
        case 1:
            assetName = "circle"
        case 2:
            assetName = "polygon"
        case 3:
            assetName = "star"
        case 4:
            assetName = "roundsquare"
        default:
            break
        }
        
        //Return an image constructed from what existed in my images folder based on logic above
        return UIImage(named: (assetName))!
        
    }
    
}