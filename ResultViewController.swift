//
//  resultViewController.swift
//  quizz
//
//  Created by Ahmad Adnan Abdullah on 2020-11-05.
//

import UIKit

class ResultViewController: UIViewController {
    let resultView = ResultView()
    
    override func loadView(){
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        resultView.button.addTarget(self,action: #selector(backButtonHandler), for: .touchUpInside )
        // Do any additional setup after loading the view.
    }
    @objc private func backButtonHandler(){
        navigationController?.popToRootViewController(animated: true)
    }
    

 
}
