//
//  NavigationBar.swift
//  Backgroundtest
//
//  Created by Al Batool Company on 11/15/16.
//  Copyright © 2016 Al Batool Company. All rights reserved.
//

import UIKit

class NavigationBar: UINavigationBar {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        let view: UIView = UIView(frame: CGRect(x: 0, y: 20, width: frame.size.width, height: 44))
        view.backgroundColor = UIColor(colorLiteralRed: 245/255, green: 255/255, blue: 240/255, alpha: 1.0)
        embedImageIntoView(imageName: "toplogo_app", view: view)
        self.addSubview(view)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
    }
    
    private func embedImageIntoView(imageName: String, view: UIView) {
        
        let logo = UIImage(named: imageName)
        let imageView = UIImageView(frame: CGRect(x:0,y:0,width:150,height:30))
        imageView.image = logo
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.center.x = view.center.x
        imageView.center.y = (view.bounds.height / 2)
        view.addSubview(imageView)
        
    }
    
}
