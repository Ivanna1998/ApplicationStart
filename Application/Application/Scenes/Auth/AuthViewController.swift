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
    
    @IBOutlet weak var username: UITextField!
  
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signUp(_ sender: UIButton) {
        self.newSwitchMain()
    }
    
    @IBAction func secondPassword(_ sender: UIButton) {
        self.oldSwitchMain()
        
    }
    
    @IBAction func login(_ sender: UIButton) {
        guard let usernameText = username.text,
            let passwordText = password.text,
            passwordText.count >= 6
            else { return }
        
        Auth.auth().signIn(withEmail: usernameText,
                           password: passwordText) { [weak self] (user, error) in
                            if let error = error {
                                debugPrint(error.localizedDescription)
                                return
                            }
                            //debugPrint(user)
                            self?.switchMain()
        }
    }
    
    private func switchMain() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        guard let main = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateInitialViewController()
            else { return }
        appDelegate.window?.rootViewController = main
    }
    
    private func newSwitchMain() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        guard let main = UIStoryboard(name: "NewAuth", bundle: Bundle.main).instantiateInitialViewController()
            else { return }
        appDelegate.window?.rootViewController = main
    }

    private func oldSwitchMain() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        guard let main = UIStoryboard(name: "OldAuth", bundle:     Bundle.main).instantiateInitialViewController()
            else { return }
        appDelegate.window?.rootViewController = main
    }
    
}

//import Foundation
