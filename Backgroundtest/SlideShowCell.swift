//
//  SlideShowCell.swift
//  Backgroundtest
//
//  Created by Al Batool Company on 1/18/17.
//  Copyright © 2017 Al Batool Company. All rights reserved.
//

import UIKit

class SlideShowCell: UICollectionViewCell {
    
    var slideImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(slideImage)
        slideImage.translatesAutoresizingMaskIntoConstraints = false
        slideImage.topAnchor.constraint(equalTo: (contentView.topAnchor)).isActive = true
        slideImage.bottomAnchor.constraint(equalTo: (contentView.bottomAnchor)).isActive = true
        slideImage.leftAnchor.constraint(equalTo: (contentView.leftAnchor)).isActive = true
        slideImage.rightAnchor.constraint(equalTo: (contentView.rightAnchor)).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
