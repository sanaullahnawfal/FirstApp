//
//  ViewController.swift
//  Backgroundtest
//
//  Created by Al Batool Company on 11/2/16.
//  Copyright © 2016 Al Batool Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var locationView     : UIView!
    @IBOutlet weak var newArrivalView   : UIView!
    @IBOutlet weak var offerView        : UIView!
    @IBOutlet weak var productsView     : UIView!
    @IBOutlet weak var contactView      : UIView!
    @IBOutlet weak var slideShow        : UIView!
    
    var locationGesture     = UITapGestureRecognizer()
    var newArrivalGesture   = UITapGestureRecognizer()
    var offerGesture        = UITapGestureRecognizer()
    var productGesture      = UITapGestureRecognizer()
    var contactGesture      = UITapGestureRecognizer()
    
    lazy var slideShowView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    let cellIdentifier = "slideimage"
    
    var slideShowImages = [UIImage]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        locationView.layer.cornerRadius     = 25
        locationView.layer.masksToBounds    = true
        
        slideShowView.register(SlideShowCell.self, forCellWithReuseIdentifier: cellIdentifier)
        slideShow.addSubview(slideShowView)
        slideShowView.translatesAutoresizingMaskIntoConstraints = false
        slideShowView.topAnchor.constraint(equalTo: slideShow.topAnchor).isActive = true
        slideShowView.bottomAnchor.constraint(equalTo: slideShow.bottomAnchor).isActive = true
        slideShowView.leftAnchor.constraint(equalTo: slideShow.leftAnchor).isActive = true
        slideShowView.rightAnchor.constraint(equalTo: slideShow.rightAnchor).isActive = true
        
        styleCustomNavigationBar()
        
        fetchSlideShowImages()
        
        slideShowView.reloadData()
        
        locationGesture                     = registerGestureToView(view: locationView)
        newArrivalGesture                   = registerGestureToView(view: newArrivalView)
        offerGesture                        = registerGestureToView(view: offerView)
        productGesture                      = registerGestureToView(view: productsView)
        contactGesture                      = registerGestureToView(view: contactView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slideShowImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SlideShowCell
        cell.slideImage.image = slideShowImages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: slideShowView.frame.width, height: slideShowView.frame.height)
    }
    
    func registerGestureToView (view: UIView) -> UITapGestureRecognizer {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.iconTapped(_:)))
        view.addGestureRecognizer(gesture)
        return gesture
    }

    func iconTapped(_ sender:UITapGestureRecognizer) {
        switch sender {
        case locationGesture:
            performSegue(withIdentifier: "location", sender: sender)
        case newArrivalGesture:
            performSegue(withIdentifier: "newarrival", sender: sender)
        case offerGesture:
            performSegue(withIdentifier: "offer", sender: sender)
        case productGesture:
            performSegue(withIdentifier: "product", sender: sender)
        case contactGesture:
            performSegue(withIdentifier: "contact", sender: sender)
        default:
            print("Please tap on the right place")
        }
    }
    
    private func fetchSlideShowImages() {
        
        var imageURL = [String]()
        for i in 1...4 {
            imageURL.append("http://www.mybatool.com/app/slideshow/" + String(i) + ".jpg")
        }
        for url in imageURL {
            let image = ProductViewController.convertURLToImage(imageUrl: url)
            slideShowImages.append(image)
        }
        
    }
    
    private func styleCustomNavigationBar() {
        
        let titleImage = UIImageView(image: #imageLiteral(resourceName: "toplogo_app").withRenderingMode(.alwaysOriginal))
        titleImage.frame = CGRect(x: 0, y: 0, width: 134, height: 30)
        titleImage.contentMode = .scaleAspectFit
        let titleImageView = UIView(frame: CGRect(x: 0, y: 0, width: 134, height: 30))
        titleImageView.addSubview(titleImage)
        navigationItem.titleView = titleImageView
        
        
        let menuButton = UIButton(type: .system)
        menuButton.setImage(#imageLiteral(resourceName: "menubutton").withRenderingMode(.alwaysOriginal), for: .normal)
        menuButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        menuButton.tintColor = .none
        menuButton.contentMode = .scaleAspectFit
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
    }
    

}

