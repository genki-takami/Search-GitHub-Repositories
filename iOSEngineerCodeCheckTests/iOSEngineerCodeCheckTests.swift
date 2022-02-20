//
//  iOSEngineerCodeCheckTests.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import XCTest
import Alamofire
@testable import iOSEngineerCodeCheck

class iOSEngineerCodeCheckTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// responseJSON()メソッドの返り値を正常にデコードしているかの表示テスト
    func testAPI_responseJSON() throws {

        let expect = expectation(description: "あらもファイアーーーーーー、、、これは成功します！")

        let baseURL = "https://api.github.com/search/repositories?q="
        let urlString = baseURL + "Alamofire"

        AF.request(urlString).responseJSON() { response in

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                let repositries: Repositories = try decoder.decode(Repositories.self, from: response.data!)
                print(repositries.items)

                expect.fulfill()
            } catch {
                XCTFail(error.localizedDescription)
                expect.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5) { error in
            if let _ = error {
                XCTFail("ターーーーーーーーーーイム！！！")
            } else {
                print("完了")
            }
        }
    }

    /// responseDecodable()メソッドの返り値を正常にデコードしているかの表示テスト
    func testAPI_responseDecodable() throws {
        
        let expect = expectation(description: "これは失敗します")

        let baseURL = "https://api.github.com/search/repositories?q="
        let urlString = baseURL + "swift"

        AF.request(urlString).validate().responseDecodable(of: Repositories.self) { response in

            //一応出力
            print(response.value as Any)
            expect.fulfill()

            switch response.result {
            case.success(let repo):
                print(repo.items)
                expect.fulfill()
            case . failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5) { error in
            if let _ = error {
                XCTFail("ターーーーーーーーーーイム！！！")
            } else {
                print("完了")
            }
        }
    }

    /// URLSessionメソッドの返り値を正常に取得しているかの表示テスト
    func testAPI_URLSession() throws {

        let task: URLSessionTask?
        let expect = expectation(description: "URLSession")

        let url = "https://api.github.com/search/repositories?q=swift"
        task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, err) in
            if let obj = try! JSONSerialization.jsonObject(with: data!) as? [String: Any] {
                if let items = obj["items"] as? [[String: Any]] {
                    print(items)
                    expect.fulfill()
                }
            }
        }
        task?.resume()

        waitForExpectations(timeout: 5) { error in
            if let _ = error {
                XCTFail("ターーーーーーーーーーイム！！！")
                task?.cancel()
            } else {
                print("完了")
            }
        }
    }
    
    /// Modalで表示するエラーメッセージが正しく表示されているか
    func testErrorMessage() throws {
        let expect = expectation(description: "絵文字と日本語をテスト")
        var errorMessage = ""
        
        let word = "こんにちは✋"

        APIClient.fetchRepositories(word) { result in
            switch result {
            case .success(_):
                errorMessage = "成功"
            case .failure(let error):
                errorMessage = String(describing: error)
            }
            
            expect.fulfill()
            XCTAssertEqual(errorMessage, "リポジトリが存在しません！")
        }
        
        waitForExpectations(timeout: 5) { error in
            if let _ = error {
                XCTFail("ターーーーーーーーーーイム！！！")
            } else {
                print("完了")
            }
        }
    }
}
