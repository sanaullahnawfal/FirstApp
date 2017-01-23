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
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    let slideShowPageControl: UIPageControl = {
        let pageControl                             = UIPageControl()
        pageControl.pageIndicatorTintColor          = UIColor(white: 100/255, alpha: 1)
        pageControl.currentPageIndicatorTintColor   = UIColor(red: 255/255, green: 100/255, blue: 100/255, alpha: 1)
        pageControl.numberOfPages                   = 4
        return pageControl
    }()
    
    let cellIdentifier  = "slideimage"
    
    var slideShowImages = [UIImage]()
    
    var timer = Timer()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        locationView.layer.cornerRadius         = locationView.frame.width/2
        locationView.layer.masksToBounds        = true
        //locationView.layer.borderWidth        = 1
        //locationView.layer.borderColor        = UIColor.white.cgColor
        
        slideShowView.register(SlideShowCell.self, forCellWithReuseIdentifier: cellIdentifier)
        slideShow.addSubview(slideShowView)
        slideShowView.translatesAutoresizingMaskIntoConstraints                                 = false
        slideShowView.topAnchor.constraint(equalTo: slideShow.topAnchor).isActive               = true
        slideShowView.bottomAnchor.constraint(equalTo: slideShow.bottomAnchor).isActive         = true
        slideShowView.leftAnchor.constraint(equalTo: slideShow.leftAnchor).isActive             = true
        slideShowView.rightAnchor.constraint(equalTo: slideShow.rightAnchor).isActive           = true
        
        slideShow.addSubview(slideShowPageControl)
        slideShowPageControl.translatesAutoresizingMaskIntoConstraints                          = false
        slideShowPageControl.bottomAnchor.constraint(equalTo: slideShow.bottomAnchor).isActive  = true
        slideShowPageControl.leftAnchor.constraint(equalTo: slideShow.leftAnchor).isActive      = true
        slideShowPageControl.rightAnchor.constraint(equalTo: slideShow.rightAnchor).isActive    = true
        slideShowPageControl.heightAnchor.constraint(equalToConstant: 40).isActive              = true
        
        styleCustomNavigationBar()
        
        fetchSlideShowImages()
        
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
        
        locationGesture                     = registerGestureToView(view: locationView)
        newArrivalGesture                   = registerGestureToView(view: newArrivalView)
        offerGesture                        = registerGestureToView(view: offerView)
        productGesture                      = registerGestureToView(view: productsView)
        contactGesture                      = registerGestureToView(view: contactView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer.invalidate()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x/slideShow.frame.width)
        slideShowPageControl.currentPage = pageNumber
        timer.fire()
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
    
    func autoScroll() {
        var indexPath = IndexPath()
        if(slideShowPageControl.currentPage == slideShowImages.count - 1) {
            indexPath = IndexPath(item: 0, section: 0)
            slideShowView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            slideShowPageControl.currentPage = 0
        } else {
            indexPath = IndexPath(item: slideShowPageControl.currentPage + 1, section: 0)
            slideShowView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            slideShowPageControl.currentPage += 1
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
        menuButton.frame = CGRect(x: 0, y: 0, width: 25, height: 30)
        menuButton.tintColor = .none
        menuButton.contentMode = .scaleAspectFit
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
    }
    

}

