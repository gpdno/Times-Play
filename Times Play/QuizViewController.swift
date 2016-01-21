//
//  QuizViewController.swift
//  Times Play
//
//  Created by Gregory DeNinno on 1/19/16.
//  Copyright © 2016 SCDE. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var passedMultiplicationNumber = String()
    
    let numberOfRounds = 10
    
    var currentRound = 1
    
    var numberCorrect = 0
    
    var randomArray = [0, 0, 0, 0]
    
    var imageArray: [UIImage] = [UIImage(named: "star.png")!, UIImage(named: "circle.png")!, UIImage(named: "square.png")!, UIImage(named: "triangle.png")!]

    @IBOutlet var buttonViews: [UIButton]!
    
    @IBOutlet var imageViews: [UIImageView]!
    
    @IBOutlet var numberOfQuestions: UILabel!
    
    @IBOutlet var currentScore: UILabel!
    
    @IBOutlet var questionText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playGame()
    }

    
    @IBAction func buttonViewsPressed(btn: UIButton) {
        
    }
    func playGame() {
        
        numberOfQuestions.text = "Questions: \(currentRound) of \(numberOfRounds)"
        
        if currentRound <= numberOfRounds {
            
            guessValues()
//
//            setButtons()
            
            currentRound++
            
        } else {
            
          //  endGame()
            
        }
        
    }
    
//    func endGame() {
//        
//        totalScore.hidden = false
//        
//        totalScore.text = "Final Score:  \(numberCorrect) out of \(numberOfRounds)"
//        
//        showAlert()
//    }
    

    func guessValues() {
        
        let randomResult = (Int(arc4random_uniform(12)) + 1)
        
        randomArray[0] = randomResult * Int(passedMultiplicationNumber)!
        
        for i in 1...3 {
            
            randomArray[i] = Int(arc4random_uniform(144)) + 1
            
        }
        
        questionText.text = "\(passedMultiplicationNumber) X \(randomResult)"
        
        print(passedMultiplicationNumber)
        print(randomArray)
        
    }
    
//    func setButtons() {
//        
//        let newArray = randomArray.shuffle()
//   
//        buttonViews[1].setTitle("\(newArray[0])", forState: UIControlState.Normal)
//        buttonViews[2].setTitle("\(newArray[1])", forState: UIControlState.Normal)
//        buttonViews[3].setTitle("\(newArray[2])", forState: UIControlState.Normal)
//        buttonViews[4].setTitle("\(newArray[3])", forState: UIControlState.Normal)
//        
//        let newArrayImages = imageArray.shuffle()
//        
//        let imageViewOne = UIImageView(image: newArrayImages[0])
//        let imageViewTwo = UIImageView(image: newArrayImages[1])
//        let imageViewThree = UIImageView(image: newArrayImages[2])
//        let imageViewFour = UIImageView(image: newArrayImages[3])
//        
//        imageViews[1].addSubview(imageViewOne)
//        imageViews[2].addSubview(imageViewTwo)
//        imageViews[3].addSubview(imageViewThree)
//        imageViews[4].addSubview(imageViewFour)
//        
//    }
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