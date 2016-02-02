//
//  Highscore.swift
//  Times Play
//
//  Created by Gregory DeNinno on 2/1/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import Foundation

class Highscore: NSObject, NSCoding {
    
    var playername: String!
    var playerscore: Int!
    
    init(name: String, score: Int) {
        playername = name
        playerscore = score
    
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.playername = aDecoder.decodeObjectForKey("playername") as? String
        self.playerscore = aDecoder.decodeObjectForKey("playerscore") as? Int
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.playername, forKey: "playername")
        aCoder.encodeObject(self.playerscore, forKey: "playerscore")
    }
}