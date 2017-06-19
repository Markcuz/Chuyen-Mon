//
//  NQQCTableViewController.swift
//  Chuyen Mon
//
//  Created by Marcus Pham on 6/05/2016.
//  Copyright © 2016 Marcus Pham. All rights reserved.
//

import UIKit

class NQQCTableViewController: UITableViewController {
    
    var docs = [PDF]()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadDocs()
    }
    
    func loadDocs() {
        let NQQCVN = PDF(name: "Nội Quy & Quy Chế - Tiếng Việt", type: 5, path: "NQQC_VN", image: UIImage(named: "NoneImage"), path2: "None")!
        
        let NQQCEN = PDF(name: "Constitution & Regulations - English", type: 5, path: "NQQC_EN", image: UIImage(named: "NoneImage"), path2: "None")!
        
        docs+=[NQQCVN, NQQCEN]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PDFTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PDFTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let doc = docs[indexPath.row]
        
        cell.namePDFLabel.text = doc.name
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       // if segue.identifier == "ShowPDF" {
            print("went to show")
            let PDFDetailViewController = segue.destination as! PDFViewController
            
            // Get the cell that generated this segue.
            if let selectedPDFCell = sender as? PDFTableViewCell {
                let indexPath = tableView.indexPath(for: selectedPDFCell)!
                let selectedPDF = docs[indexPath.row]
                PDFDetailViewController.doc = selectedPDF
            }
            
        //}
        //else {
          //  print("got another segue")
        //}
    }
    

}
