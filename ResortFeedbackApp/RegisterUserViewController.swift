//
//  RegisterUserViewController.swift
//  ResortFeedbackApp
//
//  Created by admin on 4/28/21.
//

import UIKit

class RegisterUserViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var deletebut: UIButton!
    @IBOutlet weak var printallbut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        deletebut.isHidden = true
        printallbut.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated:true)
    }
    @IBAction func deleteGuests(_ sender: Any) {
        DBHelper.inst.deleteAllGuests()
    }
    @IBAction func submitUser(_ sender: Any) {
        let dic = ["username" : nameField.text!, "password" : passField.text!]
        DBHelper.inst.addGuest(guestDataObject: dic)
        
    }
    
    @IBAction func printAllGuests(_ sender: Any) {
        let guests = DBHelper.inst.getAllGuests()
        for g in guests {
            print("Username: ", g.username!,"Password: ", g.password!)
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
