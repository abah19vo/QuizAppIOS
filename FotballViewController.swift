//
//  FotballViewController.swift
//  quizz
//
//  Created by Ahmad Adnan Abdullah on 2020-10-29.
//

import UIKit

class FotballViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var fotballDHandler: UIButton!
    @IBOutlet weak var fotballCHandler: UIButton!
    @IBOutlet weak var fotballAHamndler: UIButton!
    @IBOutlet weak var fotballBHamndler: UIButton!
    @IBOutlet weak var theQuestion: UILabel!
    
    var qustions: [Question] = [] {
        didSet {
            qustion = qustions.removeFirst()
        }
    }
    
    var qustion : Question?
    var numberOfQuestions = 0
    var rightAnswers = 0
    
    private var haveWon = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var buttons = [fotballAHamndler,fotballBHamndler,fotballDHandler,fotballCHandler]
        buttons.forEach{ (button) in button?.layer.cornerRadius=20
            
        }
        
        theQuestion.text = qustion?.question
        buttons.shuffle()
        let correctButton = buttons.removeFirst()
        correctButton?.setTitle(qustion?.correctAnswer, for: .normal)
        
        qustion?.incorrectAnswers.forEach({(answer) in let button = buttons.removeFirst()
            button?.setTitle(answer, for: .normal)
            
        })
        // Do any additional setup after loading the view.
    }

    
    @IBAction func fotballChoie(_ sender: Any) {
        checkRightAnswer(button: fotballAHamndler)

        
    }
    @IBAction func fotballWrongChoie(_ sender: Any) {
        checkRightAnswer(button: fotballBHamndler)

    }
    
    @IBAction func fotballCChoie(_ sender: Any) {
        checkRightAnswer(button: fotballCHandler)

        
    }
    @IBAction func fotballDWrongChoie(_ sender: Any) {
        checkRightAnswer(button: fotballDHandler)

    }
    
    
    
    private func showRightAnswerAllert(button: UIButton){
        haveWon = true
        rightAnswers += 1
        let alertControll=UIAlertController(title:"youre right", message: "one point is added to youre score", preferredStyle:  UIAlertController.Style.alert)
        
        alertControll.addAction(UIAlertAction(title: "take me to the next question", style: UIAlertAction.Style.default, handler: { [weak self] (_) in
            self?.goToNextScreen()
        }))
        
        present(alertControll, animated: true, completion: nil)
    }
    
    
    private func showWrongAnswerAllert(button:UIButton){
        haveWon = false
        
        button.backgroundColor = .red
        
        let alertControll=UIAlertController(title:"no more points this time", message: "cklick next to try again", preferredStyle:  UIAlertController.Style.alert)
        
        alertControll.addAction(UIAlertAction(title: "NEXT", style: UIAlertAction.Style.default, handler:{ [weak self] (_) in
            self?.goToNextScreen()
        }))
        
        present(alertControll, animated: true, completion: nil)
    }
    
    private func checkRightAnswer(button: UIButton){
        if button.title(for: .normal) == qustion?.correctAnswer {
            showRightAnswerAllert(button: button)

        } else{
            showWrongAnswerAllert(button: button)
        }
    }
    
    private func goToNextScreen() {
        guard qustions.isEmpty == false,
              let questionViewController = storyboard?.instantiateViewController(withIdentifier: "FotballViewController") as? FotballViewController
        else {
            performSegue(withIdentifier: "goToResultView", sender: nil)
            return
        }
        
        questionViewController.numberOfQuestions = numberOfQuestions
        questionViewController.rightAnswers = rightAnswers
        questionViewController.qustions = qustions
        navigationController?.pushViewController(questionViewController, animated: true)
    }
    
 
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewController = segue.destination as? ResultViewController {
            resultViewController.resultView.resultLabel.text = "you answerd \(rightAnswers) right of \(numberOfQuestions)"
            
            
        }
    
    }
    

}
