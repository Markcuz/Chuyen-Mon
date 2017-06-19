//
//  PDFViewController.swift
//  Chuyen Mon
//
//  Created by Marcus Pham on 6/05/2016.
//  Copyright © 2016 Marcus Pham. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController {

    //Mark: Properties
    
    @IBOutlet weak var pdfDisplay: UIWebView!
    
    var doc: PDF!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pdf = Bundle.main.url(forResource: doc.path, withExtension: "pdf", subdirectory: "Documents", localization: nil)  {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
