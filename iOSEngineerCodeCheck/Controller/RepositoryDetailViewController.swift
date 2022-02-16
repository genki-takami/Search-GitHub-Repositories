//
//  RepositoryDetailViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

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
        
        setUp()
    }
    
    // MARK: - SET-UP
    private func setUp() {
        
        repoFullNameLabel.text = repo.fullName
        repoLanguageLabel.text = "Written in \(repo.language ?? "使用言語不明")"
        repoStarsLabel.text = "\(repo.stargazersCount) stars"
        repoWatchersLabel.text = "\(repo.watchersCount) watchers"
        repoForksLabel.text = "\(repo.forksCount) forks"
        repoIssuesLabel.text = "\(repo.openIssuesCount) open issues"
        
        getImage()
    }
    
    // MARK: - GET AVATAR IMAGE
    private func getImage() {
        
        if let imageURL = repo.avatarImageUrl {
            URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, res, err) in
                let img = UIImage(data: data!)!
                DispatchQueue.main.async {
                    self.avatarImageView.image = img
                }
            }.resume()
        } else {
            // TODO: - systemImageを追加
        }
    }
}
