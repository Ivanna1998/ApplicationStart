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
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var email: UITextField!
    
    // Button to receive a new password by mail
    @IBAction func resetPassword(_ sender: UIButton) {
        let emailText = email.text!
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        view.addSubview(activityIndicator)
        
        if emailText.isEmpty {
            displayAlert(userMessage: "The field is empty.")
            activityIndicator.stopAnimating()
        }
        
        else {
            activityIndicator.startAnimating()
    
            Auth.auth().sendPasswordReset(withEmail: emailText) { (error) in
                if let error = error {
                    debugPrint(error.localizedDescription)
                    return
                }
                self.activityIndicator.stopAnimating()
            }
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
        self.switchMain()
    }
    
    private func switchMain() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        guard let main = UIStoryboard(name: "Auth", bundle: Bundle.main).instantiateInitialViewController()
            else { return }
        appDelegate.window?.rootViewController = main
    }
    
}
