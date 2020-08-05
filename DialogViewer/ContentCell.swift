//
//  ContentCell.swift
//  DialogViewer
//
//  Created by Admin on 03.08.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {
    
    var label: UILabel!
    var text: String! {
        get {
            return label.text
        }
        
        set(newText) {
            label.text = newText
            var newLabelFrame = label.frame
            var newContentframe = contentView.frame
            let textSize = ContentCell.sizeForContentString(s: newText, forMaxWidth: maxWidth)
            newLabelFrame.size = textSize
            newContentframe.size = textSize
            label.frame = newLabelFrame
            contentView.frame = newContentframe
        }
    }
    var maxWidth: CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: self.contentView.bounds)
        label.isOpaque = false
        label.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        label.textColor = .black
        label.textAlignment = .center
        label.font = ContentCell.defaultFont()
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    class func sizeForContentString(s: String, forMaxWidth maxWidth: CGFloat) -> CGSize {


        let maxSize = CGSize(width: maxWidth, height: 1000.0)
        let opts = NSStringDrawingOptions.usesLineFragmentOrigin

        let style = NSMutableParagraphStyle()
        style.lineBreakMode = .byTruncatingHead//.byCharWrapping
        let attributes = [NSAttributedString.Key.font: ContentCell.defaultFont(), NSAttributedString.Key.paragraphStyle: style]
        let string = s as NSString
        let rect = string.boundingRect(with: maxSize, options: opts, attributes: attributes, context: nil)
        return rect.size
    }
    
    class func defaultFont() -> UIFont {
        return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    }
    
}
