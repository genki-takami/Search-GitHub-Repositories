//
//  API.swift
//  iOSEngineerCodeCheck
//
//  Created by 髙見元基 on 2022/02/16.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import Alamofire

typealias ResultHandler<T> = (Result<T, Error>) -> Void

final class APIClient {
    
    enum APIError: Error, CustomStringConvertible {
        case invalidURL
        case invalidResponse
        case unknown
        var description: String {
            switch self {
            case .invalidURL: return "リポジトリが存在しません！"
            case .invalidResponse: return "データを受信できませんでした！"
            case .unknown: return "予期せぬエラーが発生！"
            }
        }
    }
    
    static func fetchRepositories(_ word: String, handler: @escaping ResultHandler<[Repository]>) {
        
        let baseURL = "https://api.github.com/search/repositories?q="
        let urlString = baseURL + word
        
        guard let _ = URL(string: urlString) else {
            handler(.failure(APIError.invalidURL))
            return
        }
        
        AF.request(urlString).responseJSON() { response in
            guard let data = response.data else {
                handler(.failure(APIError.invalidResponse))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let repositries: Repositories = try decoder.decode(Repositories.self, from: data)
                handler(.success(repositries.items))
            } catch {
                handler(.failure(APIError.unknown))
            }
        }
    }
}
