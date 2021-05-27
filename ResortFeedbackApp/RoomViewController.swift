//
//  RoomViewController.swift
//  ResortFeedbackApp
//
//  Created by admin on 5/2/21.
//

import UIKit

class RoomViewController: UIViewController {
    @IBOutlet weak var form1: CosmosView!
    @IBOutlet weak var form2: CosmosView!
    @IBOutlet weak var form3: CosmosView!
    @IBOutlet weak var form4: CosmosView!
    @IBOutlet weak var form5: CosmosView!
    
    @IBAction func exit(_ sender: Any) {
        self.parent?.presentingViewController?.dismiss(animated: false, completion: nil)
        /*let tabbarVC = parent as! MyTabBarController
        let guest = DBHelper.inst.getGuest(name: tabbarVC.username)
        let attributes = SurveyResponse.entity().attributesByName
        for (name, _) in attributes {
            if (guest.response?.value(forKey: name) as! Int == 0) {
                print(name)
                getTopMostViewController()?.present(alert, animated: false, completion: nil)
            }
        }*/
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbarVC = parent as! MyTabBarController
        createForm(view: form1, attributeKey: "roomQ1", vc: tabbarVC)
        createForm(view: form2, attributeKey: "roomQ2", vc: tabbarVC)
        createForm(view: form3, attributeKey: "roomQ3", vc: tabbarVC)
        createForm(view: form4, attributeKey: "roomQ4", vc: tabbarVC)
        createForm(view: form5, attributeKey: "roomQ5", vc: tabbarVC)
    }
    
    func createForm(view: CosmosView, attributeKey: String, vc: MyTabBarController) {
        view.didFinishTouchingCosmos = {
            rating in
            print("here")
            DBHelper.inst.addFormData(name: vc.username, formName: attributeKey, data: rating)
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
