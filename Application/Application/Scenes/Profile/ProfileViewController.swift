//
//  ProfileViewController.swift
//  Application
//
//  Created by Admin on 28.04.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var avatar: RoundImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var secondname: UILabel!
    @IBOutlet weak var bio: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainComps()
        setupEditButton()
    }
    
    private func setupEditButton() {
        let edit = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(openEditScene))
        navigationItem.rightBarButtonItem = edit
    }
    
    @objc func openEditScene() {
        performSegue(withIdentifier: "showEdit", sender: nil)
    }
    
    private func setupMainComps() {
        bio.numberOfLines = 0
        
        avatar.image = UIImage(named: "new")
        username.text = "@johndoe"
        secondname.text = "John Doe"
        bio.text = "Bio \nMy name is John Doe"
    }
    
}
