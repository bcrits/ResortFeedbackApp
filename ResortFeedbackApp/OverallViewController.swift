//
//  OverallViewController.swift
//  ResortFeedbackApp
//
//  Created by admin on 5/6/21.
//

import UIKit

class OverallViewController: UIViewController {

    @IBOutlet weak var form1: CosmosView!
    @IBOutlet weak var form2: CosmosView!
    @IBOutlet weak var form3: CosmosView!
    @IBOutlet weak var form4: CosmosView!
    @IBOutlet weak var form5: CosmosView!
    
    @IBAction func exit(_ sender: Any) {
        self.parent?.presentingViewController?.dismiss(animated: false, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbarVC = parent as! MyTabBarController
        createForm(view: form1, attributeKey: "overallQ1", vc: tabbarVC)
        createForm(view: form2, attributeKey: "overallQ2", vc: tabbarVC)
        createForm(view: form3, attributeKey: "overallQ3", vc: tabbarVC)
        createForm(view: form4, attributeKey: "overallQ4", vc: tabbarVC)
        createForm(view: form5, attributeKey: "overallQ5", vc: tabbarVC)
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
