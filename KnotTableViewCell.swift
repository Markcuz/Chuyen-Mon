//
//  KnotTableViewCell.swift
//  Chuyen Mon
//
//  Created by Marcus Pham on 4/05/2016.
//  Copyright © 2016 Marcus Pham. All rights reserved.
//

import UIKit

class KnotTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
