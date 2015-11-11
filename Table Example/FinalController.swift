//
//  FinalController.swift
//  iQuiz
//
//  Created by Jill Lopez on 11/10/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

import Foundation
import UIKit

class FinalController: UIViewController {
    

    @IBOutlet weak var scores: UILabel!
    
    @IBOutlet weak var message: UILabel!
    
    var totalScore = 0
    
    var totalQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        scores.text = String("Score: \(totalScore) / \(totalQuestions)")
        message.text = "Nice job!"
        
        let quizScore = Double(totalScore/totalQuestions)
        
        if quizScore > 0.75 {
            message.text = "Not bad!"
        } else if quizScore <= 0.5 {
            message.text = "You should go study..."
        } else if quizScore == 1.0 {
            message.text = "Wow, you're a genius!"
        }
        
        
    }
    
    func finalScore(score : Int){
        totalScore = score
    }
    
    func totalQuestions(questions : Int){
        totalQuestions = questions
    }
}