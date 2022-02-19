//
//  iOSEngineerCodeCheckUITests.swift
//  iOSEngineerCodeCheckUITests
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import XCTest

class iOSEngineerCodeCheckUITests: XCTestCase {

    override func setUpWithError() throws {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        
        XCUIApplication().terminate()
    }

    /// 適当な文字で検索してヒットしなかった時に警告が出るかどうかのテスト
    func testSearchNotFound() throws {
        let app = XCUIApplication()
        let searchBar = app.searchFields.element
        let notFoundText = "Stygfdb"
        
        searchBar.tap()
        searchBar.typeText(notFoundText)
        app.buttons["search"].tap()
        
        let svprogresshudElement = app/*@START_MENU_TOKEN@*/.otherElements["SVProgressHUD"]/*[[".otherElements[\"「Stygfdb」を含むリポジトリは見つかりませんでした！\"]",".otherElements[\"SVProgressHUD\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        sleep(1)
        XCTAssert(svprogresshudElement.exists)
    }
    
    /// 「git」を検索して詳細画面が表示されたか確認するテスト
    func testSearchGit() throws {
        let app = XCUIApplication()
        let searchBar = app.searchFields.element
        let text = "git"
        
        searchBar.tap()
        searchBar.typeText(text)
        
        let svprogresshudElement = app/*@START_MENU_TOKEN@*/.otherElements["SVProgressHUD"]/*[[".otherElements[\"「Stygfdb」を含むリポジトリは見つかりませんでした！\"]",".otherElements[\"SVProgressHUD\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let notExists = NSPredicate(format: "exists == false")
        
        expectation(for: notExists, evaluatedWith: svprogresshudElement, handler: nil)
        app.buttons["search"].tap()
        waitForExpectations(timeout: 5, handler: nil)
        
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["git/git"]/*[[".cells.staticTexts[\"git\/git\"]",".staticTexts[\"git\/git\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.buttons["日本語にする"].exists)
    }
    
    /// 日本語に変換できているかを確認するテスト
    func testTranslateText() throws {
        let app = XCUIApplication()
        let searchBar = app.searchFields.element
        let text = "axios"
        
        searchBar.tap()
        searchBar.typeText(text)
        
        let svprogresshudElement = app/*@START_MENU_TOKEN@*/.otherElements["SVProgressHUD"]/*[[".otherElements[\"「Stygfdb」を含むリポジトリは見つかりませんでした！\"]",".otherElements[\"SVProgressHUD\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let notExists = NSPredicate(format: "exists == false")
        
        expectation(for: notExists, evaluatedWith: svprogresshudElement, handler: nil)
        app.buttons["search"].tap()
        waitForExpectations(timeout: 5, handler: nil)
        
        app.tables.staticTexts["axios/axios"].tap()
        sleep(1)
        XCTAssert(app.staticTexts["Written in JavaScript"].exists)
        
        app.buttons["日本語にする"].tap()
        XCTAssert(app.staticTexts["開発言語：JavaScript"].exists)
    }
}
