//
//  ChatViewControlller.swift
//  Application
//
//  Created by Admin on 31.03.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

final class ChatViewController: UIViewController {
    private var ref = Database.database().reference()
    private var auth = Auth.auth()
    
    @IBOutlet weak var textfield: UITextField!

    @IBOutlet weak var massegeBoard: UITextView!
    
    
    @IBAction func send(_ sender: UIButton!) {
        guard let userID = auth.currentUser?.uid,
            let message = textfield.text,
            !message.isEmpty
            else { return }
        let data = [
            "message": message
        ]
        let messageRef = ref.child("user/\(userID)/").childByAutoId()
        messageRef.setValue(data) { (error, databaseRef) in
            if let error = error {
                debugPrint("/////////////////////")
                debugPrint(error.localizedDescription)
                return
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            observeChat()
    }
    
    private func observeChat() {
        guard let userID = auth.currentUser?.uid
            else { return }

        ref.child("user/\(userID)").observe(.childAdded) {(snapshot) in
            DispatchQueue.main.async {
                let value = snapshot.value as! [String : AnyObject]
                let message = value["message"] as! String

                let text = self.massegeBoard.text
                let appendedMessage = text?.appending("\(message)\n\n")
                self.massegeBoard.text = appendedMessage
                self.textfield.text = ""
            }
        }
    }
}
