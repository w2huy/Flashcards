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
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionField.text!
        let answerText = answerField.text!
        
        if questionText.isEmpty || answerText.isEmpty {
            displayAlert()
        } else {
            flashcardsController.updateFlashcard(question: questionText, answer: answerText)
            
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
