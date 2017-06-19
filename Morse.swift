//
//  Morse.swift
//  Chuyen Mon
//
//  Created by Marcus Pham on 19/6/17.
//  Copyright © 2017 Marcus Pham. All rights reserved.
//

import UIKit

class Morse {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var morseGraph: String
    var morseTable: String
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, morseGraph: String, morseTable: String) {
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.morseGraph = morseGraph
        self.morseTable = morseTable
        
    }
}



