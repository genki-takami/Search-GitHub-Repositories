//
//  RepositoryDetailViewController+SetupText.swift
//  iOSEngineerCodeCheck
//
//  Created by 髙見元基 on 2022/02/18.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

extension RepositoryDetailViewController {
    
    /// 日本語と英語の２つのバージョン
    func setUpLabel(inJapanses: Bool) {
        
        var unitL, unitS, unitW, unitF, unitI, unitC, unitM: String
        
        if inJapanses {
            unitL = "開発言語："
            unitS = " 人が登録"
            unitW = " 人が監視中"
            unitF = " 人が複製"
            unitI = " 個の課題"
            unitC = "英語に戻す"
            unitM = "詳細"
        } else {
            unitL = "Written in "
            unitS = " stars"
            unitW = " watchers"
            unitF = " forks"
            unitI = " open issues"
            unitC = "日本語にする"
            unitM = "More"
        }
        
        repoFullNameLabel.text = repo.fullName
        repoLanguageLabel.text = unitL + (repo.language ?? "使用言語不明")
        repoStarsLabel.text = String(repo.stargazersCount) + unitS
        repoWatchersLabel.text = String(repo.watchersCount) + unitW
        repoForksLabel.text = String(repo.forksCount) + unitF
        repoIssuesLabel.text = String(repo.openIssuesCount) + unitI
        languageChangeLabel.text = unitC
        showMoreInfoLabel.text = unitM
    }
    
    /// 端末がダークモードであった場合、テキストを白色にする
    func setTextColor() {
        
        let textColor = UIColor.dynamicTextColor
        repoFullNameLabel.textColor = textColor
        repoLanguageLabel.textColor = textColor
        repoStarsLabel.textColor = textColor
        repoWatchersLabel.textColor = textColor
        repoForksLabel.textColor = textColor
        repoIssuesLabel.textColor = textColor
    }
}
