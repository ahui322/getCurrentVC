//
//  BViewController.swift
//  getCurrentVC
//
//  Created by 京睿 on 2018/11/13.
//  Copyright © 2018年 jr. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("------------------------------------------------")
        print(AppDelegate.shared)
        print("------------------------------------------------")
        print(AppDelegate.shared().getRootVC())
        print("------------------------------------------------")
        print(AppDelegate.shared().navigationViewController())
        print("------------------------------------------------")
        print(AppDelegate.shared().navigationViewController()?.topViewController)
        print("------------------------------------------------")
        print(AppDelegate.shared().navigationViewController()?.visibleViewController)
        print("------------------------------------------------")
        print(AppDelegate.shared().currentViewController())
        print("------------------------------------------------")
    }

}
