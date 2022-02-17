//
//  Repository.swift
//  iOSEngineerCodeCheck
//
//  Created by 髙見元基 on 2022/02/16.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import UIKit

/// デコードされたJSONを形成する構造体
struct Repositories: Codable {
    let items: [Repository]
}

/// 個別のリポジトリデータ
struct Repository: Codable {
    let fullName: String
    let language: String?
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let openIssuesCount: Int
    let htmlUrl: String
    let description: String

    let owner: Owner

    var ownerHTML: String {
        return owner.htmlUrl
    }
    var avatarImageUrl: URL? {
        return URL(string: owner.avatarUrl)
    }
}

/// アバター画像があるリポジトリのオーナーデータ(JSONでネストされていた)
struct Owner: Codable {
    let avatarUrl: String
    let htmlUrl: String
}
