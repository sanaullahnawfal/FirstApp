//
//  ProductCell.swift
//  Backgroundtest
//
//  Created by Al Batool Company on 11/24/16.
//  Copyright © 2016 Al Batool Company. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productImage.layer.cornerRadius = 30
        productImage.layer.borderColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        productImage.layer.borderWidth = 0
        productImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
