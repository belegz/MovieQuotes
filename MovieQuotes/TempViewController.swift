//
//  TempViewController.swift
//  MovieQuotes
//
//  Created by Tinuviel on 2020/5/5.
//  Copyright © 2020 Tinuviel. All rights reserved.
//

import UIKit

class TempViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let TempCellIdentifier = "TempCell"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TempCellIdentifier, for: indexPath)
        
        // Configure the cell
        cell.textLabel?.text = "This is row \(indexPath.row)"
        
        return cell
    }
    
    
}
