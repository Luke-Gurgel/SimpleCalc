//
//  PaddedLbl.swift
//  SimpleCalc
//
//  Created by Lucas Andrade on 8/19/18.
//  Copyright © 2018 LukeGurgel. All rights reserved.
//

import UIKit

class PaddedLbl: UILabel {

    var topInset: CGFloat = 6.0
    var bottomInset: CGFloat = 6.0
    var leftInset: CGFloat = 12.0
    var rightInset: CGFloat = 12.0
    
    override func drawText(in rect: CGRect) {
        self.layer.cornerRadius = 5
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }

}
