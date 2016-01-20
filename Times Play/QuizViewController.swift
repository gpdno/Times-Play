//
//  QuizViewController.swift
//  Times Play
//
//  Created by Gregory DeNinno on 1/19/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet var buttonViews: [UIButton]!
    
    @IBOutlet var numberOfQuestions: UILabel!
    
    @IBOutlet var currentScore: UILabel!
    
    @IBOutlet var questionText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonViewsPressed(btn: UIButton) {
    }
}