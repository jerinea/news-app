//
//  LazyImageView.swift
//  NewsApp
//
//  Created by Jerin Emmanuel on 12/17/20.
//

import UIKit

class LazyImageView: UIImageView {

    var imageUrl: String? {
        didSet {
            loadImage(imageUrl: imageUrl)
        }
    }
    
    private func loadImage(imageUrl: String?) {
        
        self.backgroundColor = UIColor(red: 0.96, green: 0.955, blue: 0.95, alpha: 1)
        self.image = nil
        guard let imageUrl = imageUrl else {
            return
        }
        let size = self.frame.size
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            
            ImageCache.instance.getImage(imageUrl, size: size, cacheType: .memoryCache, completion: { (image: UIImage?) -> Void in
                
                DispatchQueue.main.async {
                    
                    if(image != nil && imageUrl == self.imageUrl) {
                        self.image = image
                        self.backgroundColor = UIColor.white
                        
                        let transition = CATransition()
                        transition.duration = 0.2
                        transition.type = CATransitionType.fade
                        self.layer.add(transition, forKey: nil)
                    }
                }
            })
        }
    }
}
