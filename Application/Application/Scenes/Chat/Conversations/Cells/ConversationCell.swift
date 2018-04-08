//
//  ConversationCell.swift
//  Application
//
//  Created by Admin on 04.04.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ConversationCell: UICollectionViewCell {
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var lastMessageDate: UILabel!
    
    func setup(with lastMessageText: String, at date: String) {
        lastMessage.text = lastMessageText
        lastMessageDate.text = date
    }
}
