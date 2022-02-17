//
//  RepositoryMoreInfoViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 髙見元基 on 2022/02/18.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit
import SafariServices

final class RepositoryMoreInfoViewController: UIViewController {
    
    // MARK: - PROPERTY
    @IBOutlet private weak var repoSiteLabel: UILabel!
    @IBOutlet private weak var repoOwnerLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    var repoSiteURL: String!
    var repoOwnerURL: String!
    var repoDescription: String!
    var isEnglish = true
    
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var reposite, repoOwner: String
        if isEnglish {
            reposite = "Check Repository @ GitHub"
            repoOwner = "Check Repository Owner"
        } else {
            reposite = "リポジトリを閲覧する"
            repoOwner = "主のプロフィールを閲覧する"
        }
        repoSiteLabel.text = reposite
        repoOwnerLabel.text = repoOwner
        descriptionLabel.text = repoDescription
        descriptionLabel.textColor = UIColor.dynamicTextColor
    }
    
    /// SafariでGitHubにいく
    private func showBrowser(_ urlString: String) {
        
        if urlString.isEmpty {
            Modal.showError("Webページが見つかりません")
        } else {
            guard let url = URL(string: urlString) else { return }
            present(SFSafariViewController(url: url), animated: true, completion: nil)
        }
    }
    
    // MARK: - REPOSITORY WEBSITE @ GITHUB
    @IBAction private func goRepositoryWebsite(_ sender: Any) {
        guard let urlString = repoSiteURL else { return }
        showBrowser(urlString)
    }
    
    // MARK: - OWNER WEBSITE @ GITHUB
    @IBAction private func goRepositoryOwnerWebsite(_ sender: Any) {
        guard let urlString = repoOwnerURL else { return }
        showBrowser(urlString)
    }
}
