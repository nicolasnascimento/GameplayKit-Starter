//
//  AppDelegate.swift
//  GameplayKit-Starter
//
//  Created by Nicolas Nascimento on 25/07/19.
//  Copyright © 2019 Nicolas Nascimento. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Since we're not using storyboard, create the view controller and present it
        let viewController = ViewController(nibName: nil, bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }

}

