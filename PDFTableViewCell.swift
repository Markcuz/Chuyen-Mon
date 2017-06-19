//
//  PDFTableViewCell.swift
//  Chuyen Mon
//
//  Created by Marcus Pham on 6/05/2016.
//  Copyright © 2016 Marcus Pham. All rights reserved.
//

import UIKit

class PDFTableViewCell: UITableViewCell {

    //Mark: Properties
    @IBOutlet weak var namePDFLabel: UILabel!
    @IBOutlet weak var imagePDF: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
