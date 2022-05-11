//
//  OtherExtensions.swift
//  Cambix
//
//  Created by Bruno Cardenas on 14/06/21.
//
import Foundation
import UIKit

extension Dictionary {
    var prettyPrintedJSON: String? {
        do {
            let data: Data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)
        } catch _ {
            return nil
        }
    }
}
extension UIApplication {
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
extension  UIViewController {

    func showAlert(withMessage message:String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
    
        alert.addAction(ok)

        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
