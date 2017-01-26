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
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(red: 141/255, green: 147/255, blue: 51/255, alpha: 1.0)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red: 141/255, green: 125/255, blue: 51/255, alpha: 1.0).cgColor
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(categoryImage)
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryImage.topAnchor.constraint(equalTo: (contentView.topAnchor)).isActive = true
        categoryImage.bottomAnchor.constraint(equalTo: (categoryLabel.topAnchor)).isActive = true
        categoryImage.leftAnchor.constraint(equalTo: (contentView.leftAnchor)).isActive = true
        categoryImage.rightAnchor.constraint(equalTo: (contentView.rightAnchor)).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        categoryLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
