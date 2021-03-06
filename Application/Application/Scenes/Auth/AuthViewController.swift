//
//  AuthViewController.swift
//  Application
//
//  Created by Admin on 31.03.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import FirebaseAuth

final class AuthViewController: UIViewController {
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    // Button for registration (Sign up)
    @IBAction func signUp(_ sender: UIButton) {
        //performSegue(withIdentifier: "showSignUp", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSignUp" {
            let viewController = segue.destination as? FirstAuthViewController
            viewController?.emailText = username.text
            let passwordViewController = segue.destination as? OldAuthViewController
            passwordViewController?.emailText = username.text
        }
    }
    
    @IBAction func secondPassword(_ sender: UIButton) {
    }
    
    @IBAction func login(_ sender: UIButton) {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        view.addSubview(activityIndicator)
        
        guard let usernameText = username.text,
            let passwordText = password.text,
            passwordText.count >= 6
            else { return }
        
        activityIndicator.startAnimating()
        
        Auth.auth().signIn(withEmail: usernameText,
                           password: passwordText) { [weak self] (user, error) in
                            if let error = error {
                                //debugPrint("//////////////////////////////")
                                debugPrint(error.localizedDescription)
                                self?.displayAlert(userMessage: (error.localizedDescription))
                                self?.activityIndicator.stopAnimating()
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
    
    private func switchMain() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        guard let main = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateInitialViewController()
            else { return }
        appDelegate.window?.rootViewController = main
    }
}
