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
    
    /// - Parameters:
    ///   - text:     The string who want to display in the error modal
    static func showError(_ text: String) {
        if initializing == false {
            setUpSVProgressHUD()
        }
        SVProgressHUD.showError(withStatus: text)
    }
    
    static func showModal() {
        if initializing == false {
            setUpSVProgressHUD()
        }
        SVProgressHUD.show()
    }
    
    static func dismissModal() {
        if initializing == false {
            setUpSVProgressHUD()
        }
        SVProgressHUD.dismiss()
    }
    
    private static func setUpSVProgressHUD() {
        /// モーダルの外側を黒色、表示時間を１秒
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setMinimumDismissTimeInterval(1)
        initializing = true
    }
}
