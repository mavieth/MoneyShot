//
//  ViewController.swift
//  MoneyShot
//
//  Created by Michael Vieth on 7/24/15.
//  Copyright (c) 2015 Michael Vieth. All rights reserved.
//

import UIKit
import Venmo_iOS_SDK



//Secret:	nsDXTuqUVm8mKARwh73yz8sYehSsuLpU
//ID:	2786
//Android Return URL:	venmo2786://	?
//Webhook URL:	None	?
//Web Redirect URL:	https://api.venmo.com/v1/payments	?
//Privacy Policy URL:
//Terms of Service URL:
//iPhone App Store ID:


class ViewController: UIViewController {

    @IBOutlet var TextField: UITextField!
    var buttons: [UIButton] = [];
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.updateVenmoStatus();
    }
    
    func updateVenmoStatus() {
        if (Venmo.sharedInstance().isSessionValid() == true) {
            let username = Venmo.sharedInstance().session.user.displayName;
            let leftItem = UIBarButtonItem(title: username, style: UIBarButtonItemStyle.Plain, target: self, action: "logout");
            self.navigationItem.setLeftBarButtonItem(leftItem, animated: true);
        }
        else {
            let leftItem = UIBarButtonItem(title: "Login", style: UIBarButtonItemStyle.Plain, target: self, action: "login");
            self.navigationItem.setLeftBarButtonItem(leftItem, animated: true);
        }
    }
    
    
    // Login
    func login() {
        Venmo.sharedInstance().requestPermissions(["access_profile", "make_payments"], withCompletionHandler: { (success, error) -> Void in
            if (success) {
                self.updateVenmoStatus()
            }
            else {
                UIAlertView(title: "Authorization failed", message: error.localizedDescription, delegate: nil, cancelButtonTitle: "OK").show();
            }
        });
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! PaymentViewController;
        let text = (sender as! UIButton).titleForState(UIControlState.Normal)!;
    }
    
    
    func logout() {
        Venmo.sharedInstance().logout();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

