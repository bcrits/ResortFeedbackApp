//
//  ForgotPassViewController.swift
//  ResortFeedbackApp
//
//  Created by admin on 5/3/21.
//

import UIKit

class ForgotPassViewController: UIViewController {
    
    var username : String!
    
    
    @IBOutlet weak var newpass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion:     nil)
    }
    @IBAction func updatePass(_ sender: Any) {
        var guestObjectData = [String:String]()
        guestObjectData["username"] = username
        guestObjectData["password"] = newpass.text
        
        DBHelper.inst.updateGuest(guestDataObject: guestObjectData)
        print("the new password for ", DBHelper.inst.getGuest(name: "Blaire").username, " is ", DBHelper.inst.getGuest(name: "Blaire").password)
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
