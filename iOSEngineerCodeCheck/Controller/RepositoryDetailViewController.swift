//
//  ViewController2.swift
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
    
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repo = vc1.repo[vc1.idx]
        
        repoLanguageLabel.text = "Written in \(repo["language"] as? String ?? "")"
        repoStarsLabel.text = "\(repo["stargazers_count"] as? Int ?? 0) stars"
        repoWatchersLabel.text = "\(repo["wachers_count"] as? Int ?? 0) watchers"
        repoForksLabel.text = "\(repo["forks_count"] as? Int ?? 0) forks"
        repoIssuesLabel.text = "\(repo["open_issues_count"] as? Int ?? 0) open issues"
        getImage()
        
    }
    
    // MARK: - GET AVATAR IMAGE
    func getImage(){
        
        let repo = vc1.repo[vc1.idx]
        
        repoFullNameLabel.text = repo["full_name"] as? String
        
        if let owner = repo["owner"] as? [String: Any] {
            if let imgURL = owner["avatar_url"] as? String {
                URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, res, err) in
                    let img = UIImage(data: data!)!
                    DispatchQueue.main.async {
                        self.avatarImageView.image = img
                    }
                }.resume()
            }
        }
        
    }
    
}
