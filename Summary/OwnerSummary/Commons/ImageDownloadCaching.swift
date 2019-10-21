//
//  ImageDownloadCaching.swift
//  Summary
//
//  Created by diego paredes on 21/10/19.
//  Copyright © 2019 Wilman Rojas. All rights reserved.
//

import Foundation
import UIKit


class ImageDownloadCaching {
    static let cache = NSCache<NSString, UIImage>()
    
    static func downloadImage(urlArg: String, accesstokenArg: String, completion: @escaping (_ image:UIImage?)->()) {

        Requests.generalRequest(urlArg: urlArg, paramsArg: ["":""], methodArg: "GET", accesstokenArg: accesstokenArg){ data in
            var downloadedImage:UIImage?
            
            downloadedImage = UIImage(data: data)
            if downloadedImage != nil {
                cache.setObject(downloadedImage!, forKey: urlArg as NSString)
            }
            DispatchQueue.main.async {
                completion(downloadedImage)
            }
            
        }
    }
    
    static func getImage(urlArg: String, accesstokenArg: String, completion: @escaping (_ image:UIImage?)->()) {
        if let image = cache.object(forKey: urlArg as NSString) {
            completion(image)
        } else {
            downloadImage(urlArg: urlArg, accesstokenArg: accesstokenArg, completion: completion)
        }
    }
    
}
