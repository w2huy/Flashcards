//
//  ViewController.swift
//  Flashcards
//
//  Created by William Huynh on 2/22/20.
//  Copyright © 2020 wi2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
    var isFront:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardStyle()
        
        buttonStyle(btn: btnOptionOne)
        buttonStyle(btn: btnOptionTwo)
        buttonStyle(btn: btnOptionThree)
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
    
    func updateFlashcard(question:String, answer:String)  {
        backLabel.text = answer
        frontLabel.text = question
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

