//
//  RepositorySearchViewController.swift
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
    var repo = [Repository]()
    
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    // MARK: - SET-UP
    private func setUp() {
        
        repoTable.delegate = self
        repoTable.dataSource = self
        
        repoSearchBar.placeholder = "GitHubのリポジトリを検索"
        repoSearchBar.delegate = self
        
        let gesture = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - PREPARE FOR SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Detail" {
            let repositoryDetailVC = segue.destination as! RepositoryDetailViewController
            let index = repoTable.indexPathForSelectedRow!.row
            repositoryDetailVC.repo = repo[index]
        }
    }
}
