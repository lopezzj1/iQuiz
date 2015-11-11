//
//  GameController.swift
//  iQuiz
//
//  Created by Jill Lopez on 11/10/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

import UIKit

class GameView: UIViewController {
    
    var selectedQuiz = ""
    
    var mathQuiz = ["What is 4 * 5?", "18", "20", "24", "0", "2"]
    
    var heroesQuiz = ["Who is Iron Man?", "Tony Stark", "Albert Einstein", "A normal person", "Iron Man is secretly Loki", "1"]
    
    var scienceQuiz = ["Which waves are used to make and receive cellphone calls?", "Radio waves", "Sound Waves", "Tidal Waves", "Electrowaves", "1"]
    
    var currentQuiz : [String] = []
    
    var buttonSelected = 0 //int to determine which button was pressed
    
    var isAnswerCorrect = false //boolean to determine if the correct answer was selected
    
    var total = 0 //number of right answers got
    
    var questionNum = 1 //num of questions answered
    
    var answer = "" //current answer

    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    //answer one
    @IBOutlet weak var ansOneButton: UIButton!
    @IBAction func ansOneSelect(sender: AnyObject) {
        if currentQuiz[5] == "1" {
            isAnswerCorrect = true
            total++
            print("Correct!")
            
        }
        
        ansOneButton.enabled = false
        ansTwoButton.enabled = false
        ansThreeButton.enabled = false
        ansFourButton.enabled = false
        
        
        
        //button border
        ansOneButton.layer.borderWidth = 3;
        ansOneButton.layer.borderColor = UIColor(red: 71/255, green: 204/242, blue: 242/255, alpha: 1.0).CGColor
        
        buttonSelected = 1
        
    }
    
    //answer two
    @IBOutlet weak var ansTwoButton: UIButton!
    @IBAction func ansTwoSelect(sender: AnyObject) {
        if currentQuiz[5] == "2" {
            isAnswerCorrect = true
            total++
            print("Correct!")
        }
        
        ansOneButton.enabled = false
        ansTwoButton.enabled = false
        ansThreeButton.enabled = false
        ansFourButton.enabled = false
        
        //button border
        ansTwoButton.layer.borderWidth = 3;
        ansTwoButton.layer.borderColor = UIColor(red: 71/255, green: 204/242, blue: 242/255, alpha: 1.0).CGColor
    
        buttonSelected = 2

    }
    
    //answer three
    @IBOutlet weak var ansThreeButton: UIButton!
    @IBAction func ansThreeSelected(sender: AnyObject) {
        if currentQuiz[5] == "3" {
            isAnswerCorrect = true
            total++
            print("Correct!")
        }
        
        ansOneButton.enabled = false
        ansTwoButton.enabled = false
        ansThreeButton.enabled = false
        ansFourButton.enabled = false
        
        
        //button border
        ansThreeButton.layer.borderWidth = 3;
        ansThreeButton.layer.borderColor = UIColor(red: 71/255, green: 204/242, blue: 242/255, alpha: 1.0).CGColor
        
        buttonSelected = 3

    }
    
    
    //answer four
    @IBOutlet weak var ansFourButton: UIButton!
    @IBAction func ansFourSelected(sender: AnyObject) {
        if currentQuiz[5] == "4" {
            isAnswerCorrect = true
            total++
            print("Correct!")

        }
        
        ansOneButton.enabled = false
        ansTwoButton.enabled = false
        ansThreeButton.enabled = false
        ansFourButton.enabled = false
        
        
        //button border
        ansFourButton.layer.borderWidth = 3;
        ansFourButton.layer.borderColor = UIColor(red: 71/255, green: 204/242, blue: 242/255, alpha: 1.0).CGColor
        
        buttonSelected = 4
        

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //load view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if selectedQuiz == "Mathematics" {
            self.title = selectedQuiz
            currentQuiz = mathQuiz
            
            questionLabel!.text? = mathQuiz[0]
            
            ansOneButton.setTitle(mathQuiz[1], forState: .Normal)
            ansTwoButton.setTitle(mathQuiz[2], forState: .Normal)
            ansThreeButton.setTitle(mathQuiz[3], forState: .Normal)
            ansFourButton.setTitle(mathQuiz[4], forState: .Normal)
            
            
        } else if selectedQuiz == "Marvel Superheros" {
            self.title = selectedQuiz
            currentQuiz = heroesQuiz
            
            questionLabel!.text? = heroesQuiz[0]
            
            ansOneButton.setTitle(heroesQuiz[1], forState: .Normal)
            ansTwoButton.setTitle(heroesQuiz[2], forState: .Normal)
            ansThreeButton.setTitle(heroesQuiz[3], forState: .Normal)
            ansFourButton.setTitle(heroesQuiz[4], forState: .Normal)
            
            
        } else if selectedQuiz == "Science" {
            self.title = selectedQuiz
            currentQuiz = scienceQuiz
            
            questionLabel!.text? = scienceQuiz[0]
            
            ansOneButton.setTitle(scienceQuiz[1], forState: .Normal)
            ansTwoButton.setTitle(scienceQuiz[2], forState: .Normal)
            ansThreeButton.setTitle(scienceQuiz[3], forState: .Normal)
            ansFourButton.setTitle(scienceQuiz[4], forState: .Normal)
            
            
        }
        
        let index = Int(currentQuiz[5])!
        answer = currentQuiz[index]
        
    }
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func submitSelected(sender: AnyObject) {

        print("submit")
    }
    
    
    func setQuestionsAnswered(num : Int) {
        
        questionNum = num
    }
    
    func resetButtonSelected(num : Int) {
        buttonSelected = 0
    }
    
    func resetAnswerCorrect(current: Bool) {
        isAnswerCorrect = current
    }
    
    func resetAnswer(str : String) {
        answer = str
    }
    
    func resetQuiz(typeQuiz :[String]){
        currentQuiz = typeQuiz
    }
    
    //prepares for segue (Main)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let answerController = segue.destinationViewController as? AnswerController {
            answerController.selectedAnswer(isAnswerCorrect)
            answerController.currentQuestion(currentQuiz[0])
            answerController.corrAnswer(answer)
            answerController.questionsAnswered(questionNum)
            answerController.score(total)
            answerController.numberOfQuestions(10)
            answerController.quiz(currentQuiz)

        }
        
    }

    
    
    
    
}
