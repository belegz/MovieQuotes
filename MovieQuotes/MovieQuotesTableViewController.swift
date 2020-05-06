//
//  MovieQuotesTableViewController.swift
//  MovieQuotes
//
//  Created by Tinuviel on 2020/5/6.
//  Copyright © 2020 Tinuviel. All rights reserved.
//

import UIKit

class MovieQuotesTableViewController: UITableViewController {
    let movieQuoteCellIdentifier = "MovieQuoteCell"
    var names = ["Rose","Martha","Donna","Amy","Clara","Bill"]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieQuoteCellIdentifier, for: indexPath)
        //Configure the cell
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}
