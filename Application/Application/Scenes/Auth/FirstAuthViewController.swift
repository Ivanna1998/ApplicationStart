//
//  FirstAuth.swift
//  Application
//
//  Created by Admin on 06.04.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import FirebaseAuth

final class FirstAuthViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    // Button to confirm registration and log in to TabBar
    @IBAction func complete(_ sender: UIButton) {
        guard let emailText = email.text,
            let passwordText = password.text,
            passwordText.count >= 6
            else { return }
        
        if emailText.isEmpty || passwordText.isEmpty {
            displayAlert(userMessage: "The field is empty.")
        }
        
        Auth.auth().createUserAndRetrieveData(withEmail: emailText, password: passwordText) { [weak self] (user, error) in
                            if let error = error {
                                debugPrint(error.localizedDescription)
                                return
                            }
                            self?.switchMain()
        }
    }
    
    func displayAlert(userMessage: String) {
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(ok)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    // Button to return to the home page
    @IBAction func back(_ sender: UIButton) {
        self.back_switchMain()
    }
    
    private func switchMain() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        guard let main = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateInitialViewController()
            else { return }
        appDelegate.window?.rootViewController = main
    }
    
    private func back_switchMain() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        guard let main = UIStoryboard(name: "Auth", bundle: Bundle.main).instantiateInitialViewController()
            else { return }
        appDelegate.window?.rootViewController = main
    }
}
