//
//  OldAuthController.swift
//  Application
//
//  Created by Admin on 03.04.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import FirebaseAuth

final class OldAuthViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    
    // Button to receive a new password by mail
    @IBAction func resetPassword(_ sender: UIButton) {
        let emailText = email.text!
        
        Auth.auth().sendPasswordReset(withEmail: emailText) { (error) in
            if let error = error {
                //debugPrint("//////////////////////////////")
                debugPrint(error.localizedDescription)
                return
            }
        }
    }
    
    // Button to return to the home page
    @IBAction func back(_ sender: UIButton) {
        self.switchMain()
    }
    
    // LOGIN IN
    @IBAction func login(_ sender: UIButton) {
        guard let emailText = email.text,
            let newPasswordText = newPassword.text,
            newPasswordText.count >= 6
            else { return }
        
        Auth.auth().signIn(withEmail: emailText,
                           password: newPasswordText) { [weak self] (user, error) in
                            if let error = error {
                                debugPrint(error.localizedDescription)
                                return
                            }
                            self?.newSwitchMain()
        }
    }
    
    private func newSwitchMain() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        guard let main = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateInitialViewController()
            else { return }
        appDelegate.window?.rootViewController = main
    }
    
    private func switchMain() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        guard let main = UIStoryboard(name: "Auth", bundle: Bundle.main).instantiateInitialViewController()
            else { return }
        appDelegate.window?.rootViewController = main
    }
    
}
