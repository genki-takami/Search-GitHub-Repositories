//
//  SearchBarTask.swift
//  iOSEngineerCodeCheck
//
//  Created by 髙見元基 on 2022/02/16.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

extension RepositorySearchViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // 入力する際にテキストを空にする
        repoSearchBar.text = ""
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
                
        guard let word = repoSearchBar.text else { return }
        
        if word.isEmpty {
            DisplayPop.error("文字が入力されていません！")
        } else {
            
            DisplayPop.show()
            
            APIClient.fetchRepositories(word) { result in
                
                DispatchQueue.main.async {
                    DisplayPop.dismiss()
                }
                
                switch result {
                case .success(let repos):
                    self.repo = repos
                    
                    DispatchQueue.main.async {
                        self.repoTable.reloadData()
                    }
                case .failure(let error):
                    DisplayPop.error(error.localizedDescription)
                }
            }
        }
    }
}
