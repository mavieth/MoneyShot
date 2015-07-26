//
//  PaymentViewController.swift
//  MoneyShot
//
//  Created by Michael Vieth on 7/26/15.
//  Copyright (c) 2015 Michael Vieth. All rights reserved.
//


import UIKit
import Venmo_iOS_SDK


class PaymentViewController: UIViewController {


    
    @IBAction func LoginToVenmo(sender: AnyObject) {
        println("Login To Venmo");
        Venmo.sharedInstance().requestPermissions(["access_profile", "make_payments"], withCompletionHandler: { (success, error) -> Void in
            if (success) {
                self.updateVenmoStatus()
            }
            else {
                UIAlertView(title: "Authorization failed", message: error.localizedDescription, delegate: nil, cancelButtonTitle: "OK").show();
            }
        });
    }
    
    
    func updateVenmoStatus() {
        if (Venmo.sharedInstance().isSessionValid() == true) {
            let username = Venmo.sharedInstance().session.user.displayName;
            println("Thanks for logging in...");
            println(username);
            let leftItem = UIBarButtonItem(title: username, style: UIBarButtonItemStyle.Plain, target: self, action: "logout");
            self.navigationItem.setLeftBarButtonItem(leftItem, animated: true);
        }
        else {
            let leftItem = UIBarButtonItem(title: "Login", style: UIBarButtonItemStyle.Plain, target: self, action: "login");
            self.navigationItem.setLeftBarButtonItem(leftItem, animated: true);
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendButton(sender: AnyObject) {
        println("Send button tapped.");
    }
}