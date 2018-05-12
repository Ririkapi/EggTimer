//
//  ViewController.swift
//  EggTimer
//
//  Created by Ririka on 2018/04/23.
//  Copyright © 2018年 litech. All rights reserved.
//

import UIKit
import UserNotifications
if #available(iOS 10.0, *) {
    // iOS 10
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization([.badge, .sound, .alert], completionHandler: { (granted, error) in
        if error != nil {
            return
        }
        
        if granted {
            debugPrint("通知許可")
        } else {
            debugPrint("通知拒否")
        }
    })
    
} else {
    // iOS 9
    let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
    UIApplication.shared().registerUserNotificationSettings(settings)
}

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // UIFontのnameで追加したフォント名を指定します。
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

