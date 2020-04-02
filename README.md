   ![Thnx](https://github.com/adamdahan/Thnx/blob/master/icon-set.png)

<br /> 

## Welcome to Thnx

Thnx is a Fully Customizable Open Source Library Attribution framework that is used to credit the teams behind the code you use in your projects.

<br /> 
<a href="url">
<img src="https://github.com/adamdahan/Thnx/blob/master/README-assets/readme-gif.gif" height="500" width="290" >
<img src="https://github.com/adamdahan/Thnx/blob/master/README-assets/snapshot2.png" height="500" width="290" >
<img src="https://github.com/adamdahan/Thnx/blob/master/README-assets/snapshot3.png" height="500" width="290" >
</a>
<br /> 

## Cocoapods Installation

```
pod Thnx
```

## Latest example project

- [Download the latest example](https://github.com/adamdahan/Thnx/tree/master/Example).

<br /> 

## Features

- [x] Supports ALL **iOS** Github Repositories that have a license
- [x] ThnxViewController 
- [x] Dynamic Text Sizing 
- [x] Customizable
- [x] Works out of the box
- [x] Supports Orientation changes
- [x] Thnx
- [x] Use license data in your own custom views
- [x] Swift 3
- [x] iOS 10

<br /> 

## Coming soon

- [x] Support for macOS 
- [x] Super jumbo feature
- [x] Customizable error message in ThnxViewController if fails to fetch repository license (no network failures)

<br /> 

## Usage

I provided a Url class that has some common repositories used in the Github community. Thnx understands standard github urls so just copy them for your web browser when constructing a controller or thnx object.
```
// Example of a valid url from Github
https://github.com/JSSAlertView/JSSAlertView
``` 

## Note

Thnx only supports Github repositories

## Example

Here is an example of using ThnxViewController out of the box

```swift
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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: vanillaThnxViewController)
        window?.makeKeyAndVisible()
        return true
    }
}
```

Here is an example of a custom view controller

```swift
import UIKit
import Thnx

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
   
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
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: customThnxViewController)
        window?.makeKeyAndVisible()        
        return true
    }
}
```



Made with love from [Thnx.io](http://thnx.io)
