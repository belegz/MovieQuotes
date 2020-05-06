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
//    var names = ["Rose","Martha","Donna","Amy","Clara","Bill"]
    var movieQuotes = [MovieQuote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddQuoteDialog))
        movieQuotes.append(MovieQuote(quote: "I will be back", movie: "The Terminator"))
        movieQuotes.append(MovieQuote(quote: "Havo dad, Legolas", movie: "The Fellowship of The Ring"))
    }
    
    @objc func showAddQuoteDialog() {
        print("Add button!")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieQuotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieQuoteCellIdentifier, for: indexPath)
        //Configure the cell!
//        cell.textLabel?.text = names[indexPath.row]
        cell.textLabel?.text = movieQuotes[indexPath.row].quote
        cell.detailTextLabel?.text = movieQuotes[indexPath.row].movie
        
        return cell
    }
}
