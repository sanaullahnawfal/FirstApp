//
//  CategoryViewController.swift
//  Backgroundtest
//
//  Created by Al Batool Company on 1/24/17.
//  Copyright © 2017 Al Batool Company. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

struct categoryCell {
    
    let categoryImage: UIImage?
    let categoryText: String?
    
}

class CategoryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    let categoryImagesAndText = [categoryCell.init(categoryImage: UIImage(named: "cat1"), categoryText: "Fragrance"), categoryCell.init(categoryImage: UIImage(named: "cat2"), categoryText: "Hygiene"), categoryCell.init(categoryImage: UIImage(named: "cat3"), categoryText: "Makeup"), categoryCell.init(categoryImage: UIImage(named: "cat4"), categoryText: "Skincare"), categoryCell.init(categoryImage: UIImage(named: "cat5"), categoryText: "Haircare"), categoryCell.init(categoryImage: UIImage(named: "cat6"), categoryText: "Bath")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.title = "Categories"
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black]
        navigationController?.navigationBar.tintColor = UIColor(red: 141/255, green: 147/255, blue: 51/255, alpha: 1.0)
        navigationController?.navigationBar.isTranslucent = true
        collectionView?.backgroundColor = .white
        
        // Register cell classes
        self.collectionView!.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryImagesAndText.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.categoryImage.image = categoryImagesAndText[indexPath.row].categoryImage
        cell.categoryLabel.text = categoryImagesAndText[indexPath.row].categoryText
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
