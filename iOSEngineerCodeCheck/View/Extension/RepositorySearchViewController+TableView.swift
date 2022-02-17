//
//  RepositorySearchView.swift
//  iOSEngineerCodeCheck
//
//  Created by 髙見元基 on 2022/02/16.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

extension RepositorySearchViewController: UITableViewDelegate {
    
    /// レポジトリーのリストのセルがタップされた時、キーボードが開いていたら閉じる
    /// indexPathプロパティをprepareメソッドに渡す
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        performSegue(withIdentifier: "DetailSegue", sender: indexPath)
    }
}

extension RepositorySearchViewController: UITableViewDataSource {
    
    /// リポジトリーの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repo.count
    }
    
    /// リポジトリの名前を記したセル
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 50
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Repository", for: indexPath)
        
        let repositoryData = repo[indexPath.row]
        let repositoryName = cell.viewWithTag(1) as! UILabel
        repositoryName.text = repositoryData.fullName
        repositoryName.textColor = UIColor.dynamicTextColor
        
        /// 任意のセルのindexPathを挿入
        let tapGesture = MyTapGestureRecognizer(target:self, action:#selector(goToDetail(sender:)))
        tapGesture.indexValue = indexPath
        cell.addGestureRecognizer(tapGesture)
        
        return cell
    }
    
    /// セルをタップした時に実行し、senderにはMyTapGestureRecognizerのプロパティのindexValueがある
    @objc func goToDetail(sender: MyTapGestureRecognizer) {
        tableView(repoTable, didSelectRowAt: sender.indexValue!)
    }
}

// MARK: - タップしたらインデックスを返す処理(tableViewのセルで使用)
final class MyTapGestureRecognizer: UITapGestureRecognizer {
    
    var indexValue: IndexPath?
}
