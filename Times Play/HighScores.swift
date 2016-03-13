//
//  HighScores.swift
//  Times Play
//
//  Created by Gregory DeNinno on 2/23/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import Foundation

class HighScores: NSObject, NSCoding {
    
    private var _playerName: String!
    private var _playerScore: String!
    
    var playerName: String {
        return _playerName
    }
    
    var playerScore: String {
        return _playerScore
    }
    
    init(name: String, score: String) {
        self._playerName = name
        self._playerScore = score
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._playerName = aDecoder.decodeObjectForKey("name") as? String
        self._playerScore = aDecoder.decodeObjectForKey("score") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._playerName, forKey: "name")
        aCoder.encodeObject(self._playerScore, forKey: "score")
    }
}