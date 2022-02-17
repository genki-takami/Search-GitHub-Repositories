//
//  DisplayPop.swift
//  iOSEngineerCodeCheck
//
//  Created by 髙見元基 on 2022/02/16.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import SVProgressHUD

/// 画面に処理中のモーダルやエラー内容を表示
final class Modal {
    
    private static var initializing = false
    
    static func showError(_ text: String) {
        if initializing == false {
            setting()
        }
        SVProgressHUD.showError(withStatus: text)
    }
    
    static func showModal() {
        if initializing == false {
            setting()
        }
        SVProgressHUD.show()
    }
    
    static func dismissModal() {
        if initializing == false {
            setting()
        }
        SVProgressHUD.dismiss()
    }
    
    /// SVProgressHUDのセットアップ
    private static func setting() {
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setMinimumDismissTimeInterval(1)
        initializing = true
    }
}
