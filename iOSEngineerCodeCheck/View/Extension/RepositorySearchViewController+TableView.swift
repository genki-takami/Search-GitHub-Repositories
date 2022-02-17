//
//  RepositorySearchView.swift
//  iOSEngineerCodeCheck
//
//  Created by 髙見元基 on 2022/02/16.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

extension RepositorySearchViewController: UITableViewDelegate {
    
    /// レポジトリーのリストのセルがタップされた時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Detail", sender: self)
    }
}

extension RepositorySearchViewController: UITableViewDataSource {
    
    /// リポジトリーの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repo.count
    }
    
    /// リポジトリの名前を記したセル
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Repository", for: indexPath)
        
        let repositoryData = repo[indexPath.row]
        let repositoryName = cell.viewWithTag(1) as! UILabel
        repositoryName.text = repositoryData.fullName
        
        return cell
    }
}
