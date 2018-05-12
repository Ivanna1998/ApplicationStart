//
//  EdirProfileViewController.swift
//  Application
//
//  Created by Admin on 28.04.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var avatar: RoundImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func changePicture(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupTableView()
//    }
//    func setupTableView() {
//        let cellNib = UINib(nibName: "ProfileCell", bundle: Bundle.main)
//        tableView.register(cellNib, forCellReuseIdentifier: "ProfileTableViewCell")
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 50
//    }
    let list = ["Username"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        //        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileTableViewCell else { fatalError() }
//        cell.name.text = "Username"
//        cell.data.text = "username"
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//    func tableView(_ tableView: UITableView, estimatedHeightRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }

}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        avatar.image = chosenImage
        picker.dismiss(animated: true, completion: nil)
    }
}
