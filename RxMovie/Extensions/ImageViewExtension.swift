//
//  ImageViewExtension.swift
//  RxMovie
//
//  Created by Hüseyin Metin on 23.01.2020.
//  Copyright © 2020 HüseyinMetin. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func download(imageName: String?) {
        self.image = nil
        
        guard let imageName = imageName else { return }
        
        let url = "\(WebService.baseImageURL)/w500/\(imageName)"
        
        if let cacheImage = imageCache.object(forKey: NSString(string: url)) {
            self.image = cacheImage
            return
        }
        
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            if error != nil { return }
            
            DispatchQueue.main.async {
                if let data = data,
                    let image = UIImage(data: data) {
                    self.image = image
                    imageCache.setObject(image, forKey: NSString(string: url))
                }
            }
        }.resume()
    }
}
