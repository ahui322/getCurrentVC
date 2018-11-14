//
//  GViewController.swift
//  getCurrentVC
//
//  Created by 京睿 on 2018/11/14.
//  Copyright © 2018年 jr. All rights reserved.
//

import UIKit

class GViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.gray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        AppDelegate.shared().dismissViewController(self, true, nil)
    }

}
