//
//  NotificationsViewController.swift
//  Application
//
//  Created by Admin on 24.02.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        let cellNib = UINib(nibName: "NatificationsTableNewCell", bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: "NotificationsTableNewCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsTableNewCell", for: indexPath) as? NotificationsTableViewCell else { fatalError() }
        cell.name.text = "John Doe"
        cell.subName.text = "Sent notifications.Sent notifications.Sent notifications.Sent notifications.Sent notifications.Sent notifications.Sent notifications."
        cell.avatar.image = UIImage(named: "f")
    //    var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    //    if cell == nil {
    //        cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    //    }
    //    cell!.textLabel?.text = "Hello!"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, estimatedHeightRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
