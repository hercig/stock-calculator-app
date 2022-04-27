//
//  AppDelegate.swift
//  stock-calculator-app
//
//  Created by Filip Hercig on 27.04.2022..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private(set) var appController: AppController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        if #available(iOS 13.0, *) {
            window.overrideUserInterfaceStyle = .light
        }
        appController = AppController(window: window)
        appController?.startApp()
        
        return true
    }
}

