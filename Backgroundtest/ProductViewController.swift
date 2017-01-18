//
//  ProductViewController.swift
//  Backgroundtest
//
//  Created by Al Batool Company on 11/22/16.
//  Copyright © 2016 Al Batool Company. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var productTableView: UITableView!
    var products = [Products]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let url = URL(string: "http://www.mybatool.com/app/index.php")
        getJson(url: url!)
        
    }
    
    public static func convertURLToImage(imageUrl : String) -> UIImage {
        let image = NSData(contentsOf: URL(string: imageUrl)!)
        return UIImage(data: image as! Data)!
    }
    
    func getJson(url :URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if (error != nil) {
                print("error processing the webrequest : \(error?.localizedDescription)")
                return
            }
            if let jsonData = data {
                do
                {
                    let json = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String : Any]]
                    if let productDetails = json {
                        for productDetail in productDetails {
                            guard let productName = productDetail["PRD_NAME_EN"] as? String,
                                let productDescription = productDetail["DESCRIPTION_EN"] as? String,
                                let productImageURL = productDetail["IMAGE_URL"] as? String else {
                                    print("Data not correct")
                                    return
                            }
                            let productImage = ProductViewController.convertURLToImage(imageUrl : productImageURL)
                            self.products.append(Products.init(productImage: productImage, productName: productName, productDescripiton: productDescription))
                            DispatchQueue.main.async {
                                self.productTableView.reloadData()
                            }
                        }
                    }
                } catch let jsonError as NSError {
                    print("error processing the json : \(jsonError.localizedDescription)")
                }
            }
            
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if let productImage = productCell?.viewWithTag(1) as? UIImageView {
            productImage.image = products[indexPath.row].productImage
        }
        if let productName = productCell?.viewWithTag(2) as? UILabel {
            productName.text = products[indexPath.row].productName
        }
        if let productDescription = productCell?.viewWithTag(3) as? UILabel {
            productDescription.text = products[indexPath.row].productDescripiton
        }
        return productCell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

}
