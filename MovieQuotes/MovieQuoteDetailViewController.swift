//
//  MovieQuoteDetailViewController.swift
//  MovieQuotes
//
//  Created by Tinuviel on 2020/5/6.
//  Copyright © 2020 Tinuviel. All rights reserved.
//

import UIKit

class MovieQuoteDetailViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var movieLabel: UILabel!
    var movieQuote: MovieQuote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.edit, target: self, action: #selector(showEditDialog))
    }
    
    @objc func showEditDialog(){
//        print("Edit")
        let alertController = UIAlertController(title: "Create New Movie Quote", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
                    textField.placeholder = "Enter Quote"
            textField.text = self.movieQuote?.quote
                }
        alertController.addTextField { (textField) in
                    textField.placeholder = "Enter Movie"
            textField.text = self.movieQuote?.movie
                }
                
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(cancelAction)
        let submitAction = UIAlertAction(title: "Submit Quote", style: UIAlertAction.Style.default) { (action) in
            let quoteTextField = alertController.textFields![0] as UITextField
            let movieTextField = alertController.textFields![1] as UITextField
        
            self.movieQuote?.quote = quoteTextField.text!
            self.movieQuote?.movie = movieTextField.text!
            self.updateView()
                }
                alertController.addAction(submitAction)
                
                present(alertController,animated:true,completion: nil)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    func updateView(){
        quoteLabel.text = movieQuote?.quote
        movieLabel.text = movieQuote?.movie
    }
}

