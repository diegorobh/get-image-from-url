//
//  rounded_button.swift
//  Summary
//
//  Created by diego paredes on 21/10/19.
//  Copyright © 2019 Wilman Rojas. All rights reserved.
//

import UIKit

class rounded_button: UIButton {

    override func didMoveToWindow() {
        //self.backgroundColor = UIColor(red:0.44, green:0.44, blue:0.44, alpha:0.5)
        self.layer.cornerRadius = self.frame.height / 2
        //self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner ,.layerMaxXMaxYCorner]
        self.layer.masksToBounds = true
    }

}
