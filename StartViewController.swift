//
//  StartViewController.swift
//  quizz
//
//  Created by Ahmad Adnan Abdullah on 2020-11-10.
//

import UIKit

class StartViewController: UIViewController {
    var questions:[Question] = []
    var amount = 10
    var difculti = "medium"
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadQuestions(amount:amount,difculti: difculti)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        downloadQuestions(amount:amount,difculti: difculti)

    }
   
    
    
    
    @IBAction func dificultyEasy(_ sender: Any) {
        difculti = "easy"
        print(difculti)
    }
    
    
    @IBAction func dificultyMedium(_ sender: Any) {
         difculti = "medium"

    }
    
    @IBAction func dificultyHard(_ sender: Any) {
         difculti = "hard"

    }
    
    @IBAction func changeTo5(_ sender: Any) {
        amount = 5
        
    }
    
    @IBAction func changeTo10(_ sender: Any) {
        amount = 10
    }
    @IBAction func changeTo15(_ sender: Any) {
        amount = 15
    }
    
    @IBAction func changeTo20(_ sender: Any) {
        amount = 20
    }
    
    private func downloadQuestions(amount: Int,difculti: String ) {
       
        guard let url = URL(string: "https://opentdb.com/api.php?amount=\(amount)&type=multiple&difficulty=\(difculti)")
        else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard  let data = data else {
                print(error)
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let questionsResult = try? decoder.decode(QuestionResult.self, from: data)
            self.questions = questionsResult?.results ?? []
            print(self.questions)

           print(String(data: data, encoding: .utf8))
        }
        task.resume()
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let FotballViewController = segue.destination as? FotballViewController{
            
            FotballViewController.qustions = questions
            
            FotballViewController.numberOfQuestions = questions.count


        }
        
        
       
    }
    

}
