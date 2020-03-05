//
//  ViewController.swift
//  Flashcards
//
//  Created by William Huynh on 2/22/20.
//  Copyright © 2020 wi2. All rights reserved.
//

import UIKit

struct Flashcard { //Lab 3 part 1
    var question: String
    var answer:String
}

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var nextButton: UIButton! //Lab 3 part 2
    @IBOutlet weak var prevButton: UIButton! //Lab 3 part 2
    
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
    var flashcards = [Flashcard]() //Lab 3 part 1
    
    var currentIndex = 0 //Lab 3 part 2
    
    var isFront:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardStyle()
        
        buttonStyle(btn: btnOptionOne)
        buttonStyle(btn: btnOptionTwo)
        buttonStyle(btn: btnOptionThree)
        
        readSavedFlashcards()
        
        if flashcards.count == 0 {
            updateFlashcard(question: "What's the capital of Brazill?", answer: "Brasilia")
        } else {
            updateNextPrevButtons()
            updateLabels()
        }
    }
    
    func readSavedFlashcards() {
        if let dictArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String:String]] {
            let savedCards = dictArray.map { (dictionary) -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    func saveAllFlashcardsToDisk() { //Lab 3 part 3
        
        let dictArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        
        UserDefaults.standard.set(dictArray, forKey: "flashcards")
        
        print("Flashcards saved to UserDefaults")
    }
    
    @IBAction func didTapOnNext(_ sender: Any) { //Lab 3 part 2
        currentIndex = currentIndex + 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) { //Lab 3 part 2
        currentIndex = currentIndex - 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    func updateLabels() { //Lab 3 part 2
        let currentFlashcard = flashcards[currentIndex]
        
        frontLabel.text = currentFlashcard.question
        backLabel.text  = currentFlashcard.answer
    }
    
    func updateNextPrevButtons() { //Lab 3 part 2
        
        // Disable next button if at end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        // Disable next button if at begining
        if currentIndex == 0 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    

    @IBAction func didTapOnFlashcard(_ sender: UITapGestureRecognizer) {
        if isFront {
            frontLabel.isHidden = true
            backLabel.isHidden = false
        } else {
            frontLabel.isHidden = false
            backLabel.isHidden = true
        }
        isFront = !isFront
    }
    
    func updateFlashcard(question:String, answer:String) {  //Lab 3 part 1
        let flashcard = Flashcard(question: question, answer: answer)
        backLabel.text = flashcard.answer
        frontLabel.text = flashcard.question
        
        flashcards.append(flashcard)
        print("Added new flashcard")
        print("Now we have \(flashcards.count) flashcards")
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        updateNextPrevButtons() //Lab 3 part 2
        updateLabels() //Lab 3 part 2
        
        saveAllFlashcardsToDisk() //Lab 3 part 3
    }

    func buttonStyle(btn:UIButton) {
        btn.layer.borderWidth = 3.0
        btn.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        btn.layer.cornerRadius = 10.0
        btn.clipsToBounds = true
    }
    
    func cardStyle() {
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        backLabel.layer.cornerRadius = 20.0
        frontLabel.layer.cornerRadius = 20.0
        backLabel.clipsToBounds = true
        frontLabel.clipsToBounds = true
    }
    
    @IBAction func didTapOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = true
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
        if isFront {
            frontLabel.isHidden = true
            backLabel.isHidden = false
        } else {
            frontLabel.isHidden = false
            backLabel.isHidden = true
        }
        isFront = !isFront
        btnOptionOne.isHidden = false
        btnOptionThree.isHidden = false
    }
    
    @IBAction func didTapOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
    }
}

