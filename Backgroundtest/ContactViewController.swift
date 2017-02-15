//
//  ContactViewController.swift
//  Backgroundtest
//
//  Created by Al Batool Company on 11/22/16.
//  Copyright © 2016 Al Batool Company. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var emailButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        emailButton.layer.cornerRadius = 10
        navigationItem.title = "Contact Us"
        navigationController?.navigationBar.tintColor = UIColor(red: 141/255, green: 147/255, blue: 51/255, alpha: 1.0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
