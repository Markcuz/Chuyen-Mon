//
//  ScoutsTableViewController.swift
//  Chuyen Mon
//
//  Created by Marcus Pham on 6/05/2016.
//  Copyright © 2016 Marcus Pham. All rights reserved.
//

import UIKit

class ScoutsTableViewController: UITableViewController {

    var docs = [PDF]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDocs()
    }
    
    func loadDocs() {
        let Morse = PDF(name: "Morse", type: 1, path: "Morse", image: UIImage(named: "MorseImage"), path2: "None")!
        
        let Semaphore = PDF(name: "Semaphore", type: 1, path: "Semaphore", image: UIImage(named: "SemaphoreImage"), path2: "None")!
        
        let Dau = PDF(name: "Dấu Đi Đường", type:1, path: "Dau Di Duong", image: UIImage(named: "DauImage"), path2: "None")!
        
        
        docs+=[Morse, Semaphore, Dau]
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
        cell.imagePDF.image = doc.image
        
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
        
        let PDFDetailViewController = segue.destination as! PDFViewController
        
        // Get the cell that generated this segue.
        if let selectedPDFCell = sender as? PDFTableViewCell {
            let indexPath = tableView.indexPath(for: selectedPDFCell)!
            let selectedPDF = docs[indexPath.row]
            PDFDetailViewController.doc = selectedPDF
        }
        
    }

}
