//
//  UIViewControllerExtension.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import UIKit

fileprivate var ToastActivityView: UnsafePointer<UIView>? = nil

extension UIViewController {
    
    func showAlert(_ title: String, message: String) {
        
        DispatchQueue.main.async { () -> Void in
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showActivity() {
        
        if let _ = objc_getAssociatedObject(self, &ToastActivityView) as? UIView {
            return
        }
        
        let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge);
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.color = UIColor.darkGray
        self.view.addSubview(activity)
        activity.startAnimating()
        
        NSLayoutConstraint.activate([
            activity.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            activity.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        // associate the activity view with self
        objc_setAssociatedObject (self, &ToastActivityView, activity, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
    }
    
    func hideActivity() {
        if let existingView = objc_getAssociatedObject(self, &ToastActivityView) as? UIView {
            existingView.removeFromSuperview()
            objc_setAssociatedObject (self, &ToastActivityView, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
