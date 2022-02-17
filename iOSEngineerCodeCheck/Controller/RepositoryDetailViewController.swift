//
//  RepositoryDetailViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit
import AlamofireImage

final class RepositoryDetailViewController: UIViewController {
    
    // MARK: - PROPERTY
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var repoFullNameLabel: UILabel!
    @IBOutlet weak var repoLanguageLabel: UILabel!
    @IBOutlet weak var repoStarsLabel: UILabel!
    @IBOutlet weak var repoWatchersLabel: UILabel!
    @IBOutlet weak var repoForksLabel: UILabel!
    @IBOutlet weak var repoIssuesLabel: UILabel!
    var repo: Repository!
    
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLabelAndImage()
    }
    
    // MARK: - SET-UP
    private func setUpLabelAndImage() {
        
        repoFullNameLabel.text = repo.fullName
        repoLanguageLabel.text = "Written in \(repo.language ?? "使用言語不明")"
        repoStarsLabel.text = "\(repo.stargazersCount) stars"
        repoWatchersLabel.text = "\(repo.watchersCount) watchers"
        repoForksLabel.text = "\(repo.forksCount) forks"
        repoIssuesLabel.text = "\(repo.openIssuesCount) open issues"
        
        setTextColor()
        getImage()
    }
    
    // MARK: - DYNAMICALLY CHANGE TEXT COLOR
    private func setTextColor() {
        /// 端末がダークモードであった場合、テキストを白色にする
        let textColor = UIColor.dynamicTextColor
        repoFullNameLabel.textColor = textColor
        repoLanguageLabel.textColor = textColor
        repoStarsLabel.textColor = textColor
        repoWatchersLabel.textColor = textColor
        repoForksLabel.textColor = textColor
        repoIssuesLabel.textColor = textColor
    }
    
    // MARK: - GET AVATAR IMAGE
    private func getImage() {
        
        if let imageURL = repo.avatarImageUrl {
            avatarImageView.af.setImage(withURL: imageURL, placeholderImage: UIImage(systemName: "icloud.and.arrow.down"))
        } else {
            avatarImageView.image = UIImage(systemName: "questionmark.square.dashed")
        }
    }
}
