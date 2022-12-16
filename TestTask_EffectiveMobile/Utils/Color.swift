//
//  Color.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 14.12.2022.
//

import Foundation
import UIKit
import SwiftUI

extension Color {
    
    init?(hex: String){
        var hexClean = hex.trimmingCharacters(in: .whitespaces)
        hexClean = hexClean.replacingOccurrences(of: "#", with: "")
        let length = hexClean.count
        var rgb: UInt64 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        
        guard Scanner(string: hexClean).scanHexInt64(&rgb) else {
            return nil
        }
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        } else {
            return nil
        }
        self.init(red: r, green: g, blue: b)
    }
}
