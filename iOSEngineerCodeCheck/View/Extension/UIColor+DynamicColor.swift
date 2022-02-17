//
//  UIColor+DynamicColor.swift
//  iOSEngineerCodeCheck
//
//  Created by 髙見元基 on 2022/02/18.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// - Parameters:
    ///   - light:     text color is always black
    ///   - dark:      text color is always white
    /// - Returns:     Text color that depends on dark mode
    public class func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        /// iOS13移行であればダークモードかどうかで色を変える
        if #available(iOS 13, *) {
            return UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return dark
                } else {
                    return light
                }
            }
        }
        return light
    }
    
    public static var dynamicTextColor: UIColor {
        return dynamicColor(light: .black, dark: .white)
    }
}
