//
//  NewAuth.swift
//  Application
//
//  Created by Admin on 03.04.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import FirebaseAuth

final class NewAuthViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var phone_password: UITextField!
    
    @IBAction func complete(_ sender: UIButton) {
    }
    
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
