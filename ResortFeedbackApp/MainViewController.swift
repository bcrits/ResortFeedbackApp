//
//  ViewController.swift
//  ResortFeedbackApp
//
//  Created by admin on 4/22/21.
//

import UIKit

class MainViewController: UIViewController {
    
    var username : String!
    
    @IBOutlet weak var greeting: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        greeting.text = "Welcome, " + username + ". We hope you're enjoying your stay with us."
    }

    @IBAction func enter(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let surveyVC = storyboard.instantiateViewController(identifier:"survey") as! MyTabBarController
        surveyVC.modalPresentationStyle = .fullScreen
        surveyVC.username = username
        present(surveyVC, animated: false)
    }
    @IBAction func logout(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
        
    }
}

