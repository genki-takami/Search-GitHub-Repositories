//
//  DisplayPop.swift
//  iOSEngineerCodeCheck
//
//  Created by 髙見元基 on 2022/02/16.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import Foundation
import SVProgressHUD

final class DisplayPop {
    
    private static var initializing = false
    
    static func success(_ text: String) {
        if initializing == false { setting() }
        SVProgressHUD.showSuccess(withStatus: text)
    }
    
    static func error(_ text: String) {
        if initializing == false { setting() }
        SVProgressHUD.showError(withStatus: text)
    }
    
    static func show() {
        if initializing == false { setting() }
        SVProgressHUD.show()
    }
    
    private static func setting() {
        // SVProgressHUDのセットアップ
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setMinimumDismissTimeInterval(1)
        initializing = true
    }
}
