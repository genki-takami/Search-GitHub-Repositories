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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        task?.cancel()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let baseURL = "https://api.github.com/search/repositories?q="
        
        guard let word = repoSearchBar.text else { return }
        
        if word.isEmpty {
            DisplayPop.error("文字が入力されていません！")
        } else {
            let url = baseURL + word
            task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, err) in
                if let obj = try! JSONSerialization.jsonObject(with: data!) as? [String: Any] {
                    if let items = obj["items"] as? [[String: Any]] {
                        self.repo = items
                        DispatchQueue.main.async {
                            self.repoTable.reloadData()
                        }
                    }
                }
            }
            
            // これ呼ばなきゃリストが更新されません
            task?.resume()
        }
    }
}
