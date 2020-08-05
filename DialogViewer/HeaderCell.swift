//
//  HeaderCell.swift
//  DialogViewer
//
//  Created by Admin on 03.08.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class HeaderCell: ContentCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.8, alpha: 1.0)
        label.textColor = .black
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override class func defaultFont() -> UIFont {
        return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
    }
}
