//
//  CreationViewController.swift
//  Flashcards
//
//  Created by William Huynh on 2/22/20.
//  Copyright © 2020 wi2. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!
    
    @IBOutlet weak var questionField: UITextField!
    @IBOutlet weak var answerField: UITextField!
    
    @IBOutlet weak var ans1TextField: UITextField!
    @IBOutlet weak var ans2TextField: UITextField!
    @IBOutlet weak var ans3TextField: UITextField!
    
    var initialQuestion: String?
    var initialAnwser: String?
    
    var initialans1: String?
    var initialans2: String?
    var initialans3: String?
    
    func displayAlert() {
        let alert = UIAlertController(title: "Missing Text", message: "You need to fill out all fields to update flashcards", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        print("Handle Ok logic here")
        }))

        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        questionField.text = initialQuestion
        answerField.text = initialAnwser
        
        ans1TextField.text = initialans1
        ans2TextField.text = initialans2
        ans3TextField.text = initialans3
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionField.text!
        let answerText = answerField.text!
        
        let ans1Text = ans1TextField.text!
        let ans2Text = ans2TextField.text!
        let ans3Text = ans3TextField.text!
        
        if questionText.isEmpty || answerText.isEmpty {
            displayAlert()
        } else {
            var isExisting = false
            if initialQuestion != nil {
                isExisting = true
            }
            
            flashcardsController.updateFlashcard(question: questionText, answer: answerText, ans1: ans1Text, ans2: ans2Text, ans3: ans3Text, isExisting: isExisting)
            
            dismiss(animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
