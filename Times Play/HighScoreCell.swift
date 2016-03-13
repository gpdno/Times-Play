//
//  HighScoreCell.swift
//  Times Play
//
//  Created by Gregory DeNinno on 2/23/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import UIKit

class HighScoreCell: UITableViewCell {
    
    @IBOutlet weak var playerLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(scores: HighScores) {
        playerLbl.text = scores.playerName
        scoreLbl.text = scores.playerScore
    }

}
