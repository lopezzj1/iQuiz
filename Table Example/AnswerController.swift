//
//  AnswerController.swift
//  iQuiz
//
//  Created by Jill Lopez on 11/10/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

import Foundation
import UIKit

class AnswerController : UIViewController {
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var correctAnswer: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var isCorrect = false
    
    var answer = ""
    
    var questionNum = 0
    
    var question = ""
    
    var count = 0
    
    var scoresCount = 0
    
    var numOfQues = 0
    
    var currentQuiz : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        if isCorrect == true {
            
            answerLabel.text = "CORRECT!"
            answerLabel.textColor = UIColor.greenColor()
            questionLabel.text = "Great Job!"
            correctAnswer.text = ""
            
        } else if isCorrect == false {
            
            answerLabel!.text? = "INCORRECT!"
            answerLabel.textColor = UIColor.redColor()
            questionLabel.text = question
            correctAnswer.text = "The answer was: \(answer)"
            
        }
        
        print("Number of current questions answered: \(count)")
        print("Current score: \(scoresCount)")
        print("Total num of questions: \(numOfQues)")
        
    }
    
    func selectedAnswer(selected : Bool) {
        isCorrect = selected
    }
    
    func corrAnswer(ans : String){
        answer = ans
    }
    
    func currentQuestion(que : String){
        question = que
    }
    
    func questionsAnswered(currentCount : Int){
        count = currentCount
    }
    
    func score(currentScore : Int){
        scoresCount = currentScore
    }
    
    func numberOfQuestions(numQuestions : Int){
        numOfQues = numQuestions
        
    }
    
    func quiz(typeQuiz : [String]){
        currentQuiz = typeQuiz
    }
    
    @IBAction func nextSelected(sender: AnyObject) {
        
        if count < 10 {
            self.performSegueWithIdentifier("BacktoQuestion", sender: nil)
        } else {
            self.performSegueWithIdentifier("FinalSegue", sender: nil)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if count >= 10 {
            //go to finished segue
            
            if let finishedController = segue.destinationViewController as? FinalController {
                finishedController.finalScore(scoresCount)
                finishedController.totalQuestions(numOfQues)
            }
            
        } else if count < 10 { //else {
            if let gameController = segue.destinationViewController as? GameView {
                gameController.resetQuiz(currentQuiz)
                gameController.viewDidLoad()
                gameController.setQuestionsAnswered(count)
                gameController.resetButtonSelected(0)
                gameController.resetAnswerCorrect(false)
                gameController.resetAnswer("")
                
            }
            
        }
        
        
    }
    
    
}
