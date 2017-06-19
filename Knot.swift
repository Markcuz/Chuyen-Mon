//
//  Knot.swift
//  Chuyen Mon
//
//  Created by Marcus Pham on 5/05/2016.
//  Copyright © 2016 Marcus Pham. All rights reserved.
//

import UIKit

class Knot {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var path: String
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, path: String) {
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.path = path
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || path.isEmpty{
            return nil
        }
    }
}



