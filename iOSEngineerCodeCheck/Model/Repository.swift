//
//  Repository.swift
//  iOSEngineerCodeCheck
//
//  Created by 髙見元基 on 2022/02/16.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import UIKit

struct Repositories: Codable {
    let items: [Repository]
}

struct Repository: Codable {
    let fullName: String
    let language: String?
    let stargazersCount: Int
    let watchersCount: Int
    let forksCount: Int
    let openIssuesCount: Int

    let owner: Owner

    var avatarImageUrl: URL? {
        return URL(string: owner.avatarUrl)
    }
}

struct Owner: Codable {
    let avatarUrl: String
}
