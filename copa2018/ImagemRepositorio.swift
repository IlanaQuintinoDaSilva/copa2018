//
//  ImageUtil.swift
//  copa2018
//
//  Created by Anderson Andreatta on 25/05/18.
//  Copyright © 2018 Anderson Andreatta. All rights reserved.
//

import Foundation
import UIKit

class ImageRepository  {
    
    func save(_ image:UIImage, name:String) {
        let path = filePath(name)
        let data = UIImagePNGRepresentation(image)
        
        try? data!.write(to: URL(fileURLWithPath: path), options: [.atomic])
    }
    
    func load(_ name:String) -> UIImage? {
        let path = filePath(name)
        let image = UIImage(contentsOfFile: path)
        
        return image
    }
    
    
    func filePath(_ fileName:String) -> String {
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
        return fileURL.path
    }
    
}
