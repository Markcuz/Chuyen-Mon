//
//  PDF.swift
//  Chuyen Mon
//
//  Created by Marcus Pham on 5/05/2016.
//  Copyright © 2016 Marcus Pham. All rights reserved.
//

import UIKit

class PDF {
    // MARK: Properties
    
    var name: String
    var type: Int
    var path: String
    var image: UIImage?
    var path2: String
    
    // MARK: Initialization
    
    init?(name: String, type: Int, path: String, image: UIImage?, path2: String) {
        
        // Initialize stored properties.
        self.name = name
        self.type = type
        self.path = path
        self.image = image
        self.path2 = path2
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty ||  type<0 || path.isEmpty {
            return nil
        }
    }
}
