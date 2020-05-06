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
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddQuoteDialog))
        movieQuotes.append(MovieQuote(quote: "I will be back", movie: "The Terminator"))
        movieQuotes.append(MovieQuote(quote: "Havo dad, Legolas", movie: "The Fellowship of The Ring"))
    }
    
    @objc func showAddQuoteDialog() {
        //        print("Add button!")
        // TODO: add a dialog CRUD
        let alertController = UIAlertController(title: "Create New Movie Quote", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Quote"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Movie"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelAction)
        //        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        let submitAction = UIAlertAction(title: "Create Quote", style: UIAlertAction.Style.default) { (action) in
//            print("TODO: create a movie quote")
            // Add a quote
            let quoteTextField = alertController.textFields![0] as UITextField
            let movieTextField = alertController.textFields![1] as UITextField
//            print(quoteTextField.text!)
//            print(movieTextField.text!)
            let newMovieQuote = MovieQuote(quote: quoteTextField.text!, movie: movieTextField.text!)
            self.movieQuotes.insert(newMovieQuote, at: 0)
            self.tableView.reloadData()
        }
        alertController.addAction(submitAction)
        
        present(alertController,animated:true,completion: nil)
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            print("Delete")
            movieQuotes.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
