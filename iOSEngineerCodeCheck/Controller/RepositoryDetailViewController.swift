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
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet weak var repoFullNameLabel: UILabel!
    @IBOutlet weak var repoLanguageLabel: UILabel!
    @IBOutlet weak var repoStarsLabel: UILabel!
    @IBOutlet weak var repoWatchersLabel: UILabel!
    @IBOutlet weak var repoForksLabel: UILabel!
    @IBOutlet weak var repoIssuesLabel: UILabel!
    @IBOutlet private weak var stackPocketView: UIView!
    @IBOutlet weak var languageChangeLabel: UILabel!
    @IBOutlet weak var showMoreInfoLabel: UILabel!
    var repo: Repository!
    var isEnglish = true
    
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// stackPocketViewの角を丸くしてUILabelをセットし、ダークモードに対応のち画像を挿入
        stackPocketView.layer.cornerRadius = 10
        setUpLabel(inJapanses: false)
        setTextColor()
        getImage()
    }
    
    private func getImage() {
        
        if let imageURL = repo.avatarImageUrl {
            avatarImageView.af.setImage(withURL: imageURL, placeholderImage: UIImage(systemName: "icloud.and.arrow.down"))
        } else {
            avatarImageView.image = UIImage(systemName: "questionmark.square.dashed")
        }
    }
    
    // MARK: - CHANGE TEXT LANGUAGE
    @IBAction private func changeLanguage(_ sender: Any) {
        
        if isEnglish {
            setUpLabel(inJapanses: true)
            isEnglish = false
        } else {
            setUpLabel(inJapanses: false)
            isEnglish = true
        }
    }
    
    // MARK: - SHOW MORE INFORMATION
    @IBAction private func showMoreInfo(_ sender: Any) {
        /// 詳細画面にいく
        let repositoryMoreInfoVC = self.storyboard?.instantiateViewController(withIdentifier: "repositoryMoreInfo") as! RepositoryMoreInfoViewController
        repositoryMoreInfoVC.modalPresentationStyle = .custom
        repositoryMoreInfoVC.transitioningDelegate = self
        repositoryMoreInfoVC.repoSiteURL = repo.htmlUrl
        repositoryMoreInfoVC.repoOwnerURL = repo.ownerHTML
        repositoryMoreInfoVC.repoDescription = repo.description
        repositoryMoreInfoVC.isEnglish = isEnglish
        present(repositoryMoreInfoVC, animated: true, completion: nil)
    }
}

extension RepositoryDetailViewController: UIViewControllerTransitioningDelegate {
    
    /// カスタムポップアップViewを返す
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
