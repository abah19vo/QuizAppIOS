//
//  qustionViewController.swift
//  quizz
//
//  Created by Ahmad Adnan Abdullah on 2020-10-28.
//

import UIKit

class qustionViewController: UIViewController {
    
    @IBOutlet weak var fightingAHamndler: UIButton!
    @IBOutlet weak var fightingBHamndler: UIButton!
    var qustion: Question?
    
    private var haveWon = false


    override func viewDidLoad() {
        super.viewDidLoad()

        fightingAHamndler.layer.cornerRadius = 20
        fightingBHamndler.layer.cornerRadius = 20

    }
    
    
    
    
    @IBAction func fightingChoie(_ sender: Any) {
        showRightAnswerAllert(button: fightingAHamndler)
        
    }
    
    @IBAction func fightingWrongChoie(_ sender: Any) {
        showWrongAnswerAllert(button: fightingBHamndler)
    }
    
    
    
    private func showRightAnswerAllert(button: UIButton){
        haveWon = true
        let alertControll=UIAlertController(title:"And he is the 🐐", message: "Who is better than khabib and how", preferredStyle:  UIAlertController.Style.alert)
        
        alertControll.addAction(UIAlertAction(title: "take me to the next question", style: UIAlertAction.Style.default, handler: {(_) in
            self.performSegue(withIdentifier: "goToResultView", sender: nil)
        }))
        
        present(alertControll, animated: true, completion: nil)
    }
    
    
    private func showWrongAnswerAllert(button:UIButton){
        haveWon = false
        
        button.backgroundColor = .red
        
        let alertControll=UIAlertController(title:"And he is NOT the 🐐", message: "Who is better than khabib and how", preferredStyle:  UIAlertController.Style.alert)
        
        alertControll.addAction(UIAlertAction(title: "take me to the next question", style: UIAlertAction.Style.default, handler: {(_) in
            self.performSegue(withIdentifier: "goToResultView", sender: nil)
        }))
        
        present(alertControll, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewController = segue.destination as? ResultViewController {
            resultViewController.resultView.resultLabel.text = haveWon ? "😎": "🥺"
            
        }
    }
 
}

