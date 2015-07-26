//
//  ViewController.swift
//  MoneyShot
//
//  Created by Michael Vieth on 7/24/15.
//  Copyright (c) 2015 Michael Vieth. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//Secret:	nsDXTuqUVm8mKARwh73yz8sYehSsuLpU
//ID:	2786
//Android Return URL:	venmo2786://	?
//Webhook URL:	None	?
//Web Redirect URL:	https://api.venmo.com/v1/payments	?
//Privacy Policy URL:
//Terms of Service URL:
//iPhone App Store ID:


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        access_token REQUIRED	Your own access token used for authentication to the API.
//        user_id	145434160922624933
//        email	venmo@venmo.com
//        phone	15555555555
//        note REQUIRED	A message to accompany the payment.
//        amount REQUIRED	0.10
//        var accessToken = "49458175efa92e5af8d62f405b373ff0ef1af3ce998fb16fee98ebec219f0161"
//        var userID = "145434160922624933"
//        var note = "Tits"
//        var amount = "10.00"
//        
//        var url = "https://sandbox-api.venmo.com/v1/payments"
//        
//        let parameters = [
//            "accessToken": "49458175efa92e5af8d62f405b373ff0ef1af3ce998fb16fee98ebec219f0161",
//            "user_id": userID,
//            "note": note,
//            "amount": amount
//        ]
//        
//        var req = Alamofire.request(.POST, "http://httpbin.org/post", parameters: parameters)
//        debugPrintln(req)
//        
////        Alamofire.request(.POST, "http://httpbin.org/post", parameters: parameters as! [String : AnyObject])
//        // HTTP body: foo=bar&baz[]=a&baz[]=1&qux[x]=1&qux[y]=2&qux[z]=3
//        
//        let x = Alamofire.request(.GET, url)
//            .response { request, response, data, error in
//                println("REQUEST")
//                println(request)
//                println("")
//                println("RESPONSE")
//                println(response)
//                println("")
//                println("ERROR")
//                println(error)
//                println("")
//        }
//        https://api.venmo.com/v1/me?access_token=4e4sw1111111111t8an8dektggtcbb45
        
        
        var url = "https://api.venmo.com/v1/me"
        Alamofire.request(.GET, url, parameters: ["access_token": "49458175efa92e5af8d62f405b373ff0ef1af3ce998fb16fee98ebec219f0161"])
            .responseJSON { (req, res, json, error) in
                if(error != nil) {
                    NSLog("Error: \(error)")
                    println(req)
                    println(res)
                }
                else {
                    NSLog("Success: \(url)")
                    
                    var json = JSON(json!)
//                    println(json)
                    for (key: String, subJson: JSON) in json {
                        print("Balance: ")
                        println(subJson["balance"])
                        println(subJson["user"]["id"])
                        println(subJson["user"]["about"])
                        print("Number of Friends: ")
                        println(subJson["user"]["friends_count"])
                        
                    }
                }
                
        }



        
        
        
//        var url = "https://sandbox-api.venmo.com/v1/payments"
//        
//        var x = Alamofire.request(.GET, url)
//        debugPrint(x)
//
//        Alamofire.request(.GET, url)
//            .responseString { _, _, string, _ in
//                println(string)
//        }
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

