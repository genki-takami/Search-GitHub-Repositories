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

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testAPI_responseJSON() throws {

        let expect = expectation(description: "あらもファイアーーーーーー")

        let baseURL = "https://api.github.com/search/repositories?q="
        let urlString = baseURL + "Alamofire"

        AF.request(urlString).responseJSON() { response in

            switch response.result {
            case .success(let data):
                let repositries: Repositories = try! JSONDecoder().decode(Repositories.self, from: obj)
                //print(repositries.items)
                //expect.fulfill()
            case .failure(_):
                print("失敗")
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

    func testAPI_responseDecodable() throws {
        let expect = expectation(description: "あらもファイアーーーーーー2")

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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
