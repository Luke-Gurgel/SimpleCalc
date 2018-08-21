//
//  RoundBtn.swift
//  SimpleCalc
//
//  Created by Lucas Andrade on 8/19/18.
//  Copyright © 2018 LukeGurgel. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {

    var cornerRadius: CGFloat = 8.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.layer.cornerRadius = cornerRadius
    }

}
