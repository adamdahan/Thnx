![Thnx](https://github.com/adamdahan/Thnx/blob/master/README-assets/logo-big-bg.png)

## Welcome to Thnx

Thnx is a Open Source Library Attribution framework that is used to credit the teams behind the code you use in your projects.


<a href="url">
<img src="https://github.com/adamdahan/Thnx/blob/master/README-assets/readme-gif.gif" height="500" width="290" >
<img src="https://github.com/adamdahan/Thnx/blob/master/README-assets/snapshot2.png" height="500" width="290" >
<img src="https://github.com/adamdahan/Thnx/blob/master/README-assets/snapshot3.png" height="500" width="290" >
</a>


* [Download the latest example](https://github.com/adamdahan/Thnx/tree/master/Example).

## Features

- [x] ThnxViewController 
- [x] Dynamic Text Sizing 
- [x] Customizable
- [x] Works out of the box
- [x] Supports Orientation changes
- [x] Thnx
- [x] Use license data in your own custom views
- [x] Swift 3
- [x] iOS 10

## Usage

```swift
import UIKit
import Thnx

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // Vanilla view controller
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
        window?.rootViewController = UINavigationController(rootViewController: thnxViewController) // customThnxViewController
        window?.makeKeyAndVisible()
    }
}
```
