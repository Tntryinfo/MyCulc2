//
//  AppDelegate.swift
//  CalculatorApp
//
//  Created by TakumaNishioka on 2018/06/04.
//  Copyright © 2018年 TakumaNishioka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // アプリ初回起動時の処理
        let userDefault = UserDefaults.standard
        let dict = ["firstLaunch": true]
        userDefault.register(defaults: dict)
        // 初回起動時のみtrueなので初回起動時以外実行されない
        if userDefault.bool(forKey: "firstLaunch") {
            userDefault.set(false, forKey: "firstLaunch")
            var taxList = [taxData]()
            // 5%の設定
            let taxdata1 = taxData()
            taxdata1.taxTableName = "5%"
            taxdata1.taxPercent = 5
            taxdata1.taxActive = false
            taxdata1.taxCustom = false
            taxList.append (taxdata1)
            // 8%の設定
            let taxdata2 = taxData()
            taxdata2.taxTableName = "8%"
            taxdata2.taxPercent = 8
            taxdata2.taxActive = true
            taxdata2.taxCustom = false
            taxList.append (taxdata2)
            // 10%の設定
            let taxdata3 = taxData()
            taxdata3.taxTableName = "10%"
            taxdata3.taxPercent = 10
            taxdata3.taxActive = false
            taxdata3.taxCustom = false
            taxList.append (taxdata3)
            // 初期Taxの保存処理
            // Data型にシリアライズする
            let data = NSKeyedArchiver.archivedData(withRootObject: taxList)
            userDefault.set (data, forKey: "taxList")
            userDefault.synchronize()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

