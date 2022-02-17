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
    
    private func setUp() {
        
        repoTable.delegate = self
        repoTable.dataSource = self
        
        repoSearchBar.placeholder = "GitHubのリポジトリを検索"
        repoSearchBar.delegate = self
        
        /// ソフトウェアキーボードの外をタップしたら、それを閉じる
        let gesture = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - PREPARE FOR SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailSegue" {
            let repositoryDetailVC = segue.destination as! RepositoryDetailViewController
            /// 引数senderはタップされたセルのindexPath
            let indexPath = sender as! IndexPath
            repositoryDetailVC.repo = repo[indexPath.row]
        }
    }
}

extension RepositorySearchViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        /// 入力する際にテキストとリポジトリの配列を空にする
        repoSearchBar.text = ""
        repo.removeAll()
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let word = repoSearchBar.text else { return }
        
        if word.isEmpty {
            Modal.showError("文字が入力されていません！")
        } else {
            
            /// キーボードを閉じてモーダルを開始し、ユーザが誤タッチするのを防ぐ
            view.endEditing(true)
            Modal.showModal()
            
            APIClient.fetchRepositories(word) { result in
                
                DispatchQueue.main.async {
                    Modal.dismissModal()
                }
                
                switch result {
                case .success(let repos):
                    self.repo = repos
                    
                    DispatchQueue.main.async {
                        self.repoTable.reloadData()
                    }
                case .failure(let error):
                    Modal.showError(error.localizedDescription)
                }
            }
        }
    }
}
