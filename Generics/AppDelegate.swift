//
//  AppDelegate.swift
//  Generics
//
//  Created by Marknel Pineda on 06/07/2018.
//  Copyright © 2018 mvpineda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        window?.rootViewController = MainViewController(collectionViewLayout: layout)
        
        return true
    }


}

