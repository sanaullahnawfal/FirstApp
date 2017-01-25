//
//  CategoryCollectionViewCell.swift
//  Backgroundtest
//
//  Created by Al Batool Company on 1/25/17.
//  Copyright © 2017 Al Batool Company. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    let categoryImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    let categoryLabel: UILabel = {
        
        let label = UILabel()
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categoryImage)
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.topAnchor.constraint(equalTo: (contentView.topAnchor)).isActive = true
        categoryImage.bottomAnchor.constraint(equalTo: (contentView.bottomAnchor)).isActive = true
        categoryImage.leftAnchor.constraint(equalTo: (contentView.leftAnchor)).isActive = true
        categoryImage.rightAnchor.constraint(equalTo: (contentView.rightAnchor)).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
