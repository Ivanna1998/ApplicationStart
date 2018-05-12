//
//  RoundImageView.swift
//  Application
//
//  Created by Admin on 28.04.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

@IBDesignable
class RoundImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = frame.width / 2
            layer.masksToBounds = true
        }
    }
}
