//
//  AppDelegate.swift
//  Example
//
//  Created by Adam Dahan on 2016-10-25.
//  Copyright © 2016 88Labs. All rights reserved.
//

import UIKit
import Thnx

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // Vanilla view controller
    lazy var vanillaThnxViewController: ThnxViewController = {
        let urls = [Url.Alamofire,
                    Url.MBProgressHUD,
                    Url.ImagePicker,
                    Url.Graph,
                    Url.Algorithm,
                    Url.Material]
        return ThnxViewController(urls: urls)
    }()
    
    // Custom view controller
    lazy var customThnxViewController: ThnxViewController = {
        let urls = [Url.Alamofire,
                    Url.MBProgressHUD,
                    Url.ImagePicker,
                    Url.Graph,
                    Url.Algorithm,
                    Url.Material]
        
        let t = ThnxViewController(urls: urls)
        t.title = "Open Source Libraries"
        t.sectionHeaderFont = UIFont.boldSystemFont(ofSize: 24) // Cancels UITableView section header Dynamic Text Sizing
        t.sectionHeaderTextColor = UIColor.white
        t.sectionHeaderBackgroundColor = UIColor.blue
        
        t.contentViewBackgroundColor = UIColor.blue.withAlphaComponent(0.6)
        
        t.textLabelFont = UIFont.italicSystemFont(ofSize: 10) // Cancels UITableViewCell textLabel Dynamic Text Sizing
        t.textLabelTextColor = UIColor.white
        t.textLabelBackgroundColor = UIColor.clear
        t.textLabelLayerBorderColor = UIColor.clear.cgColor
        t.textLabelLayerCornerRadius = 0
        return t
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        prepareWindow()
        return true
    }
}

extension AppDelegate {

    func prepareWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: vanillaThnxViewController) // customThnxViewController
        window?.makeKeyAndVisible()
    }
}

