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
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    // Button to confirm registration and log in to TabBar
    @IBAction func complete(_ sender: UIButton) {
        
        guard let emailText = email.text,
            let passwordText = password.text,
            passwordText.count >= 6
            else { return }
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        Auth.auth().createUserAndRetrieveData(withEmail: emailText, password: passwordText) { [weak self] (user, error) in
                            if let error = error {
                                self?.displayAlert(userMessage: (error.localizedDescription))
                                self?.activityIndicator.stopAnimating()
                                debugPrint(error.localizedDescription)
                                return
                            }
                            self?.activityIndicator.stopAnimating()
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
        navigationController?.popViewController(animated: true)
    }
    
    private func switchMain() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        guard let main = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateInitialViewController()
            else { return }
        appDelegate.window?.rootViewController = main
    }
}
