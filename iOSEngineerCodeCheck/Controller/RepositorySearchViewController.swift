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
        repoTable.separatorInset = .zero
        
        repoSearchBar.placeholder = "GitHubのリポジトリを検索"
        repoSearchBar.delegate = self
        
        /// キーボードを閉じるためのボタンを設置
        setKeyboardDropdownButton()
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

// MARK: - SEARCHBAR TASK
extension RepositorySearchViewController: UISearchBarDelegate {
    
   func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        /// 入力する際にテキストを空にする
        repoSearchBar.text = ""
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
                
                switch result {
                case .success(let repos):
                    self.repo.removeAll()
                    /// 検索に引っ掛からなかったら、その旨を伝える
                    if repos.isEmpty {
                        Modal.showError("「\(word)」を含むリポジトリは見つかりませんでした！")
                    } else {
                        self.repo = repos
                        Modal.dismissModal()
                    }
                    
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
