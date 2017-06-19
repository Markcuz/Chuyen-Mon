//
//  KnotTableViewController.swift
//  Chuyen Mon
//
//  Created by Marcus Pham on 4/05/2016.
//  Copyright © 2016 Marcus Pham. All rights reserved.
//

import UIKit

class KnotTableViewController: UITableViewController {
  
    var knots = [Knot]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the sample data.
        loadSampleKnots()
    }

    
    func loadSampleKnots() {
        let ruoi = Knot(name: "Nút Ruồi", photo: UIImage(named: "Ruoi"), path: "Nut Ruoi")!
        
        let chiuKep = Knot(name: "Nút Chịu Kép", photo: UIImage(named: "ChiuKep"), path: "Nut Chiu Kep")!
        
        knots+=[ruoi, chiuKep]
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

        return knots.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "KnotTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! KnotTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let knot = knots[indexPath.row]
        
        cell.nameLabel.text = knot.name
        cell.photoImageView.image = knot.photo

        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let PDFDetailViewController = segue.destination as! KnotViewController
        
        // Get the cell that generated this segue.
        if let selectedPDFCell = sender as? KnotTableViewCell {
            let indexPath = tableView.indexPath(for: selectedPDFCell)!
            let selectedKnot = knots[indexPath.row]
            PDFDetailViewController.knots = selectedKnot
        }
        
    }

}
