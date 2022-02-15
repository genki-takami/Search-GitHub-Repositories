//
//  ViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

final class RepositorySearchViewController: UIViewController {

    // MARK: - PROPERTY
    @IBOutlet weak var repoTable: UITableView!
    @IBOutlet weak var repoSearchBar: UISearchBar!
    var repo = [[String: Any]]()
    var task: URLSessionTask?
    
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    // MARK: - SET-UP
    private func setUp() {
        // Search Bar
        repoSearchBar.text = "GitHubのリポジトリを検索できるよー"
        repoSearchBar.delegate = self
        // Close Keyboard
        let gesture = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - PREPARE FOR SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Detail" {
            //let dtl = segue.destination as! RepositoryDetailViewController
        }
    }
}
