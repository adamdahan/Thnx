   ![Thnx](https://github.com/adamdahan/Thnx/blob/master/README-assets/logo-big-bg.png)

## Welcome to Thnx

Thnx is a Fully Customizable Open Source Library Attribution framework that is used to credit the teams behind the code you use in your projects.

<br /> 
<a href="url">
<img src="https://github.com/adamdahan/Thnx/blob/master/README-assets/readme-gif.gif" height="500" width="290" >
<img src="https://github.com/adamdahan/Thnx/blob/master/README-assets/snapshot2.png" height="500" width="290" >
<img src="https://github.com/adamdahan/Thnx/blob/master/README-assets/snapshot3.png" height="500" width="290" >
</a>
<br /> 

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

- [x] Support for macOS repositories
- [x] Super jumbo feature
- [x] Customizable error message in ThnxViewController if fails to fetch repository license (no network failures)

<br /> 

## Usage

If you would like to use the default ThnxViewController

```swift
import UIKit
import Thnx

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var thnxViewController: ThnxViewController = {
        return ThnxViewController(urls: [Url.Graph, Url.Algorithm, Url.Material])
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: thnxViewController)
        window?.makeKeyAndVisible()
        return true
    }
}
```
