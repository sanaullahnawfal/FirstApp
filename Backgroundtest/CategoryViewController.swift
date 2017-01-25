//
//  CategoryViewController.swift
//  Backgroundtest
//
//  Created by Al Batool Company on 1/24/17.
//  Copyright © 2017 Al Batool Company. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CategoryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let categoryImages = [UIImage(named: "cat1"), UIImage(named: "cat2"),UIImage(named: "cat3"),UIImage(named: "cat4"),UIImage(named: "cat5"),UIImage(named: "cat6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = "Categories"
        navigationController?.navigationBar.tintColor = UIColor(red: 141/255, green: 147/255, blue: 51/255, alpha: 1.0)

        navigationController?.title = "Categories"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black]
        navigationController?.navigationBar.tintColor = UIColor(red: 141/255, green: 147/255, blue: 51/255, alpha: 1.0)
        navigationController?.navigationBar.isTranslucent = true
        collectionView?.backgroundColor = UIColor(red: 141/255, green: 147/255, blue: 51/255, alpha: 1.0)
        
        // Register cell classes
        self.collectionView!.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.categoryImage.image = categoryImages[indexPath.row]?.withRenderingMode(.alwaysOriginal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let navBarHeight = navigationController?.navigationBar.frame.height
        let width = (view.frame.width-30)/2
        let height = (view.frame.height-60-navBarHeight!)/3
        return CGSize(width: width, height: height)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
