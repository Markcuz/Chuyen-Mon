//
//  SongTableViewController.swift
//  Chuyen Mon
//
//  Created by Marcus Pham on 6/05/2016.
//  Copyright © 2016 Marcus Pham. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    var docs = [PDF]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDocs()
    }
    
    func loadDocs() {
        //let HoaSen = PDF(name: "Hoa Sen", type: 2, path: "test", image: nil, path2: "")!
        let PhatGiao = PDF(name: "Phật Giáo Việt Nam", type: 2, path: "Phat Giao", image: UIImage(named: "PhatGiao"), path2: "Phat Giao Viet Nam")!
        let SenTrang = PDF(name: "Sen Trắng", type: 2, path: "Sen Trang", image: UIImage(named: "HoaSen"), path2: "Sen Trang")!
        
        let Advance = PDF(name: "Advance Australia Fair", type: 2, path: "Advance", image: UIImage(named: "Australia"), path2: "Advance Australia Fair")!
        let Vietnam = PDF(name: "Quốc Ca Việt Nam", type: 2, path: "Vietnam", image: UIImage(named: "Vietnam"), path2: "Quoc Ca Viet Nam")!
        
        let TramHuongDot = PDF(name: "Trầm Hương Đốt", type: 2, path: "Tram Huong Dot", image: UIImage(named: "Incense"), path2: "Tram Huong Dot")!
        let GiayThanAi = PDF(name: "Giây Thân Aí", type: 2, path: "Giay Than Ai", image: UIImage(named: "GiayThanAi"), path2: "Giay Than Ai")!
        let ToiYeuMauLam = PDF(name: "Tôi Yêu Mầu Lam", type: 2, path: "Toi Yeu Mau Lam", image: UIImage(named: "MauLam"), path2: "Toi Yeu Mau Lam")!
        
        let TraiAoLam = PDF(name: "Trai Ao Lam", type: 2, path: "Trai Ao Lam", image: UIImage(named: "MauLam"), path2: "Trai Ao Lam")!
        
        let HonLuaThieng = PDF(name: "Hồn Lửa Thiêng", type: 2, path: "Hon Lua Thieng", image: UIImage(named: "Fire"), path2: "Hon Lua Thieng")!
        
        
        
        docs+=[PhatGiao, SenTrang, Advance, Vietnam, TramHuongDot, GiayThanAi, ToiYeuMauLam, TraiAoLam, HonLuaThieng]
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
        
        let PDFDetailViewController = segue.destination as! SongDisplayViewController
        
        // Get the cell that generated this segue.
        if let selectedPDFCell = sender as? PDFTableViewCell {
            let indexPath = tableView.indexPath(for: selectedPDFCell)!
            let selectedPDF = docs[indexPath.row]
            PDFDetailViewController.doc = selectedPDF
        }
    }
    
    
}
