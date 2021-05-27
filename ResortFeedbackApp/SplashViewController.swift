//
//  SplashViewController.swift
//  ResortFeedbackApp
//
//  Created by admin on 5/5/21.
//

import UIKit

class SplashViewController: UIViewController {
    
    var position = 0

    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 4.5, target: self, selector: #selector(updateScreen), userInfo: nil, repeats: false)
        animateLogo()
        }
        
    @objc func updateScreen() {
        var st = UIStoryboard(name: "Main", bundle: nil)
        var vc = st.instantiateViewController(identifier: "login") as! LoginViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
        
    func animateLogo() {
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateLogo), userInfo: nil, repeats: true)
    }
    
    @objc func updateLogo() {
        switch (position) {
        case 0:
            UIView.animate(withDuration: 1.5) {
                self.logo.transform = CGAffineTransform(rotationAngle: (-15.0 * .pi)/180)
            }
            position = 1
        case 1:
            UIView.animate(withDuration: 3.0) {
                self.logo.transform = CGAffineTransform(rotationAngle: (30.0 * .pi)/180)
            }
        default: print("")
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
