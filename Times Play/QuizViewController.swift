//
//  QuizViewController.swift
//  Times Play
//
//  Created by Gregory DeNinno on 1/19/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController {
    
    var playCheer: AVAudioPlayer = AVAudioPlayer()
    
    var playAww: AVAudioPlayer = AVAudioPlayer()
    
    var passedMultiplicationNumber = String()
    
    var randomResult = Int()
    
    let numberOfRounds = 15
    
    var currentRound = 1
    
    var numberCorrect = 0
    
    var randomArray = [0, 0, 0, 0]
    
    var imageArray = [1, 2, 3, 4]
    
    let image = SetImage()
    
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    @IBOutlet var buttonFour: UIButton!
    
    @IBOutlet var imageOne: UIImageView!
    @IBOutlet var imageTwo: UIImageView!
    @IBOutlet var imageThree: UIImageView!
    @IBOutlet var imageFour: UIImageView!
    
    @IBOutlet var numberOfQuestions: UILabel!
    
    @IBOutlet var currentScore: UILabel!
    
    @IBOutlet var questionText: UILabel!
    
    @IBAction func pressButtonOne(sender: UIButton) {
        
        let buttonValueInt = Int(buttonOne.currentTitle!)!
        
        checkForResults(buttonValueInt)
        
    }
    
    @IBAction func pressButtonTwo(sender: UIButton) {
        
        let buttonValueInt = Int(buttonTwo.currentTitle!)!
        
        checkForResults(buttonValueInt)
    }
    
    @IBAction func pressButtonThree(sender: UIButton) {
        
        let buttonValueInt = Int(buttonThree.currentTitle!)!
        
        checkForResults(buttonValueInt)
    }
    
    @IBAction func pressButtonFour(sender: UIButton) {
        
        let buttonValueInt = Int(buttonFour.currentTitle!)!
        
        checkForResults(buttonValueInt)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPathCheer = NSBundle.mainBundle().pathForResource("Cheer", ofType: "m4a")!
        
        do {
            
            try playCheer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPathCheer))
            
        } catch {
            // process error
        }
        
        let audioPathAww = NSBundle.mainBundle().pathForResource("Aww", ofType: "m4a")!
        
        do {
            
            try playAww = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPathAww))
            
        } catch {
            // process error
        }
        
        playCheer.prepareToPlay()
        playAww.prepareToPlay()
        
        currentScore.text = "Score:  0"
        
        playGame()
    }
    
    func playGame() {
        
        if currentRound <= numberOfRounds {
            
            numberOfQuestions.text = "Questions: \(currentRound) of \(numberOfRounds)"
            
            currentRound++
            
            guessValues()
            
            setButtons()
            
        } else {
            
            endGame()
            
        }
        
    }
    
    func endGame() {
        
        let title = "Game Over"
        
        let message = "Final Score:  \(numberCorrect) out of \(numberOfRounds)"
        
        currentScore.text = message
        
        showAlert(title, message: message)
    }
    
    
    func guessValues() {
        
        randomResult = (Int(arc4random_uniform(12)) + 1)
        
        randomArray[0] = randomResult * Int(passedMultiplicationNumber)!
        
        for i in 1...3 {
            
            randomArray[i] = Int(arc4random_uniform(144)) + 1
            
        }
        
        questionText.text = "\(passedMultiplicationNumber) X \(randomResult)"
        
    }
    
    
    func checkForResults(a: Int) {
        
        if a == randomArray[0] {
            
            numberCorrect++
            
            currentScore.text = "Score:  \(numberCorrect)"
            
            playSfx("Cheer")
            
            playGame()
            
        } else {
            
            playSfx("Aww")
            
            let title = "Sorry"
            
            let correctAnswer = "The correct answer is:  \(passedMultiplicationNumber) X \(randomResult) = \(randomArray[0])"
            
            showAlert(title, message: correctAnswer)
            
        }
        
    }
    
    func setButtons() {
        
        let newArray = randomArray.shuffle()
        
        buttonOne.setTitle("\(newArray[0])", forState: UIControlState.Normal)
        buttonTwo.setTitle("\(newArray[1])", forState: UIControlState.Normal)
        buttonThree.setTitle("\(newArray[2])", forState: UIControlState.Normal)
        buttonFour.setTitle("\(newArray[3])", forState: UIControlState.Normal)
        
        let newArrayImages = imageArray.shuffle()
        
        imageOne.image = image.GetImage(newArrayImages[0])
        imageTwo.image = image.GetImage(newArrayImages[1])
        imageThree.image = image.GetImage(newArrayImages[2])
        imageFour.image = image.GetImage(newArrayImages[3])
        
    }
    
    func playSfx(name: String) {
        
        playCheer.pause()
        playAww.pause()
        
        if name == "Cheer" {
            playCheer.play()
        } else {
            playAww.play()
        }
        
    }
    
    func showAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let yesAction = UIAlertAction(title: "Ok", style: .Default) { (action) -> Void in
            
            if title == "Game Over" {
                
                self.performSegueWithIdentifier("toAwards", sender: self)
                
            } else {
                
                self.playGame()
            }
        }
        
        alertController.addAction(yesAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let thirdViewController: AwardViewController = segue.destinationViewController as! AwardViewController
        
        thirdViewController.passedNumberOfRounds = numberOfRounds
        thirdViewController.passedNumberCorrect = numberCorrect
    }

    
}



extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}