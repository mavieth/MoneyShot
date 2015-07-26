//
//  ProfileViewController.swift
//  MoneyShot
//
//  Created by Michael Vieth on 7/26/15.
//  Copyright (c) 2015 Michael Vieth. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var recipientTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    @IBOutlet weak var gameLabel: UILabel!
    
    var amount = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.amountTextField.text =  String(format:"%1.2f", self.amount);
    }
    
    
    @IBAction func sendButtonTapped(sender: AnyObject) {
        
    }
}