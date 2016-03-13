//
//  HighScoreVC.swift
//  Times Play
//
//  Created by Gregory DeNinno on 2/23/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import UIKit

class HighScoreVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataServices.instance.loadScores()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onScoresLoaded", name: "scoresLoaded", object: nil)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.instance.loadedScores.count
        
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let scores = DataServices.instance.loadedScores[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("highScoreCell") as? HighScoreCell {
            cell.configureCell(scores)
            return cell
        } else {
            let cell = HighScoreCell()
            cell.configureCell(scores)
            return cell
        }

    }
    
    func onScoresLoaded(notif: AnyObject) {
        tableView.reloadData()
    }

}
