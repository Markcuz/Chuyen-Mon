//
//  KnotViewController.swift
//  Chuyen Mon
//
//  Created by Marcus Pham on 6/05/2016.
//  Copyright © 2016 Marcus Pham. All rights reserved.
//

import UIKit

class KnotViewController: UIViewController {

    //Mark: Properties
    var knots: Knot!
    
    @IBOutlet weak var pdfDisplay: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pdf = Bundle.main.url(forResource: knots.path, withExtension: "pdf", subdirectory: "Documents", localization: nil)  {
            let req = URLRequest(url: pdf)
            pdfDisplay.loadRequest(req)
            pdfDisplay.scalesPageToFit = true
            self.view.addSubview(pdfDisplay)
        }
        
        pdfDisplay.scalesPageToFit = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
