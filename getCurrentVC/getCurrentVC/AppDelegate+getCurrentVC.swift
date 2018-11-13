//
//  AppDelegate+getCurrentVC.swift
//  ARDemo
//
//  Created by 京睿 on 2018/11/12.
//  Copyright © 2018年 京睿. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    /// 共同跳转模块, 传入参数
    @objc func pushToTheViewControllerWith(_ parameter: String) {
//        let main = UIStoryboard.init(name: "Main", bundle: nil)
//        if let b = main.instantiateViewController(withIdentifier: "BViewController") as? BViewController {
//            b.title = parameter
//            AppDelegate.shared().pushViewController(b)
//        }
    }
}

extension AppDelegate {
    @objc static func shared() -> AppDelegate {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return AppDelegate.shared()
        }
        return appDelegate
    }
    
    @objc func getRootVC() -> UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController
    }
    
    @objc func navigationViewController() -> UINavigationController? {
        guard let keyWindow = UIApplication.shared.keyWindow else { return nil }
        if let navi = keyWindow.rootViewController as? UINavigationController {
            return navi
        } else if let tabbar = keyWindow.rootViewController as? UITabBarController, let navi = tabbar.selectedViewController as? UINavigationController {
            return navi
        }
        return nil
    }
    
    @objc func currentViewController() -> UIViewController? {
        func getCurrentViewControllerWithRootViewController(_ rootVC: UIViewController?) -> UIViewController? {
            if let tabbar = rootVC as? UITabBarController {
                return getCurrentViewControllerWithRootViewController(tabbar.selectedViewController)
            } else if let navi = rootVC as? UINavigationController {
                return getCurrentViewControllerWithRootViewController(navi.visibleViewController)
            } else if let rootVC = rootVC, let presented = rootVC.presentedViewController {
                return getCurrentViewControllerWithRootViewController(presented)
            } else {
                return rootVC
            }
        }
        guard let keyWindow = UIApplication.shared.keyWindow, let rootViewController = keyWindow.rootViewController else { return nil }
        return getCurrentViewControllerWithRootViewController(rootViewController)
    }
        
    @objc func topViewController() -> UIViewController? {
        if let nav = navigationViewController() {
            return nav.topViewController
        }
        return nil
    }
    
    @objc func pushViewController(_ viewController: UIViewController) {
        guard let navigationViewController = AppDelegate.shared().navigationViewController() else { return }
        navigationViewController.pushViewController(viewController, animated: true)
    }
    
    @objc func popViewController() -> UIViewController? {
        guard let navigationViewController = AppDelegate.shared().navigationViewController() else { return nil }
        return navigationViewController.popViewController(animated: true)
    }
    
    @objc func popToRootViewController() -> [UIViewController]? {
        guard let navigationViewController = AppDelegate.shared().navigationViewController() else { return nil }
        return navigationViewController.popToRootViewController(animated: true)
    }
    
    @objc func popToViewController(_ viewController: UIViewController) -> [UIViewController]? {
        guard let navigationViewController = AppDelegate.shared().navigationViewController() else { return nil }
        return navigationViewController.popToViewController(viewController, animated: true)
    }
    
    @objc func presentViewController(_ vc: UIViewController,_ animated:Bool,_ completion: (() -> ())?) {
        guard let vc = AppDelegate.shared().topViewController() else { return }
        if let _ = vc.navigationController {
            let nav = UINavigationController.init(rootViewController: vc)
            vc.present(nav, animated: animated, completion: completion)
        } else {
            vc.present(vc, animated: animated, completion: completion)
        }
    }
    
    @objc func dismissViewController(_ vc: UIViewController,_ animated:Bool,_ completion: (() -> ())?) {
        if vc.navigationController != navigationViewController() {
            vc.dismiss(animated: true, completion: nil)
        } else {
            vc.navigationController?.popViewController(animated: true)
        }
    }
}
