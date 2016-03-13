//
//  DataServices.swift
//  Times Play
//
//  Created by Gregory DeNinno on 2/23/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import Foundation

class DataServices {
    
    let SCORE_DATA = "highScoreData"
    
    static let instance = DataServices()
    
    private var _loadedScores = [HighScores]()
    
    var loadedScores: [HighScores] {
        return _loadedScores
    }
    
    func saveScores() {
        let scoresData = NSKeyedArchiver.archivedDataWithRootObject(_loadedScores)
        NSUserDefaults.standardUserDefaults().setObject(scoresData, forKey: SCORE_DATA)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadScores() {
        if let scoresData = NSUserDefaults.standardUserDefaults().objectForKey(SCORE_DATA) as? NSData {
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(scoresData) as? [HighScores] {
                _loadedScores = postsArray
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "scoresLoaded", object: nil))
    }
    
    func addScores(scores: HighScores) {
        _loadedScores.append(scores)
        saveScores()
        loadScores()
    }
}
