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
    
    // User Image 50px x 50px
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var primaryPhoneNumber: UILabel!
    @IBOutlet var VenCalculatorInputView: UITextField!    
    @IBOutlet var amountTextField: UITextField!
    var amount = 100.00;

    
    @IBOutlet var logoutOfVenmo: UIBarButtonItem!
    
    // Log user into Venmo, Takes to venmo auth screen;   
    @IBAction func LoginToVenmo(sender: AnyObject) {
        println("Login To Venmo");
        Venmo.sharedInstance().requestPermissions(["access_profile", "make_payments","access_friends","access_phone"], withCompletionHandler: { (success, error) -> Void in
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
            let x = Venmo.sharedInstance().session.user.debugDescription;
            println(x);
//            NSString *newPath = [NSString stringWithFormat:@"venmosdk://venmo.com%@", path];
            let userID = Venmo.sharedInstance().session.description;
            let y = Venmo.sharedInstance().session.state;
            println(y);
            
            let accessToken = "54086463225f75a8f4afa8f6c112004f529f28245054ddcd25f38eb8e6d2297b";
            let url = "https://api.venmo.com/v1/users/:\(userID)?access_token=\(accessToken)";
            println(url);
            
        
            
            
            let leftItem = UIBarButtonItem(title: username, style: UIBarButtonItemStyle.Plain, target: self, action: "logout");
            self.navigationItem.setLeftBarButtonItem(leftItem, animated: true);
            
            // Amount to send
            self.amountTextField.text = String(format: "%1.2f",self.amount);
            // Username
            self.userName.text = String(Venmo.sharedInstance().session.user.displayName);
            // Primary phone
            self.primaryPhoneNumber.text = String(Venmo.sharedInstance().session.user.primaryPhone);
            // Profile Picture
            if let url  = NSURL(string: Venmo.sharedInstance().session.user.profileImageUrl),
                data = NSData(contentsOfURL: url) {
                    userImage.image = UIImage(data: data);
            }
            
        }
        else {
            let leftItem = UIBarButtonItem(title: "Login", style: UIBarButtonItemStyle.Plain, target: self, action: "login");
            self.navigationItem.setLeftBarButtonItem(leftItem, animated: true);
        }
        
    }
    
    

    

    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! PaymentViewController;
        let text = (sender as! UIButton).titleForState(UIControlState.Normal)!;
        let userNameText = (sender as! UILabel).text;
        controller.amount = (text as NSString).doubleValue;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendButton(sender: AnyObject) {
        println("Send button tapped.");
    }
    
    func logout() {
        Venmo.sharedInstance().logout();
    }
}