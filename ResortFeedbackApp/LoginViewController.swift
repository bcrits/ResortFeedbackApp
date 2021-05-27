//
//  LoginViewController.swift
//  ResortFeedbackApp
//
//  Created by admin on 5/3/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    let ud = UserDefaults.standard
    let alert = UIAlertController(title: "Invalid Login", message: "We're sorry, we can't find that username/password combination", preferredStyle: .alert)
    let alert2 = UIAlertController(title: "Invalid Username", message: "We're sorry, we can't find that username", preferredStyle: .alert)
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var forgotPass: UIButton!
    
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    @IBAction func checkUsername(_ sender: Any) {
        if (usernameField.text == "") {
            forgotPass.isHidden = true
        } else {
            forgotPass.isHidden = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        forgotPass.isHidden = true
        if (ud.bool(forKey: "state")) {
            rememberMeSwitch.isOn = true
            usernameField.text = ud.string(forKey: "id")
            passwordField.text = ud.string(forKey:
                "pass")
        } else {
            rememberMeSwitch.isOn = false
        }
    }
    
    @IBAction func login(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(identifier: "home") as! MainViewController
        homeVC.modalPresentationStyle = .fullScreen
        let isValidated = authenticate(username: usernameField.text, password: passwordField.text)
        if (isValidated) {
            homeVC.username = usernameField.text
            self.present(homeVC, animated: false, completion: nil)
        } else {
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func forgotPass(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let forgotVC = storyboard.instantiateViewController(identifier: "forgot") as! ForgotPassViewController
        var guestFound = false
        for guest in DBHelper.inst.getAllGuests() {
            if (guest.username == usernameField.text) {
                guestFound = true
            }
        }
        if (guestFound) {
            forgotVC.username = usernameField.text
            self.present(forgotVC, animated: false, completion: nil)
        } else {
            self.present(alert2, animated: false)
        }
        
    }
    @IBAction func toggleSwitch(_ sender: Any) {
        if (rememberMeSwitch.isOn) {
            ud.set(usernameField.text, forKey: "id")
            ud.set(passwordField.text, forKey: "pass")
            ud.set(true, forKey: "state")
            print("switch on")
        } else {
            ud.removeObject(forKey: "id")
            ud.removeObject(forKey: "pass")
            ud.set(false, forKey: "state")
            print("switch off")
        }
        
    }
    
    func authenticate(username: String?, password:String?) -> Bool {
        var guests = DBHelper.inst.getAllGuests()
        for guest in guests {
            if (username == guest.username && password == guest.password) {
                print("login validated")
                return true
            }
        }
        return false
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
