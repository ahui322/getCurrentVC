//
//  DViewController.swift
//  getCurrentVC
//
//  Created by 京睿 on 2018/11/13.
//  Copyright © 2018年 jr. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.orange
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        AppDelegate.shared().dismissViewController(self, true, nil)
    }

}
