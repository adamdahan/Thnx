//
//  AppDelegate.swift
//  Test
//
//  Created by Adam Dahan on 2016-10-24.
//  Copyright © 2016 88Labs. All rights reserved.
//

import UIKit
import Thnx

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ThnxViewController(urls: ["https://github.com/CosmicMind/Material"])
        window?.makeKeyAndVisible()
        return true
    }
}

