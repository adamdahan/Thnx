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
    
    lazy var thnxViewController: ThnxViewController = {
        let urls = [Url.Alamofire,
                    Url.MBProgressHUD,
                    Url.ImagePicker,
                    Url.Graph,
                    Url.Algorithm,
                    Url.Material]
        return ThnxViewController(urls: urls)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        prepareWindow()
        return true
    }
}

extension AppDelegate {

    func prepareWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: thnxViewController)
        window?.makeKeyAndVisible()
    }
}

