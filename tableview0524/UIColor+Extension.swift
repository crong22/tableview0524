//
//  UIColor+Extension.swift
//  tableview0524
//
//  Created by 여누 on 6/3/24.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    }
}
