//
//  RepositorySearchViewController+DismissKeyboard.swift
//  iOSEngineerCodeCheck
//
//  Created by 髙見元基 on 2022/02/18.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

extension RepositorySearchViewController {
    
    /// ソフトウェアキーボードの右上にキーボードを閉じるボタンを設置することで、tableViewが見やすくなる
    func setKeyboardDropdownButton() {
        
        let screenWidth = UIScreen.main.bounds.size.width
        
        let customBar = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: screenWidth,
                                             height: 50))
        
        let dropdownButton = UIButton(frame: CGRect(x: screenWidth - 50,
                                                    y: 0,
                                                    width: 40,
                                                    height: 40))
        
        customBar.backgroundColor = UIColor.clear
        
        dropdownButton.setTitleColor(UIColor.blue, for: .normal)
        dropdownButton.setImage(UIImage(systemName: "arrow.down.circle.fill"), for: .normal)
        dropdownButton.imageView?.contentMode = .scaleAspectFill
        dropdownButton.contentHorizontalAlignment = .fill
        dropdownButton.contentVerticalAlignment = .fill
        dropdownButton.addTarget(self, action: #selector(onClickCloseButton), for: .touchUpInside)
        
        customBar.addSubview(dropdownButton)
        
        repoSearchBar.inputAccessoryView = customBar
        repoSearchBar.keyboardType = .default
    }
    
    @objc func onClickCloseButton (sender: UIButton) {
        
        if repoSearchBar.isFirstResponder {
            /// ファーストレスポンダー(キーボードイベント)を解除
            repoSearchBar.resignFirstResponder()
        }
    }
}
