//
//  Line.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct Line: View {
    
    var body: some View {
        Rectangle()
            .frame(width: UIScreen.main.bounds.size.width, height: 1, alignment: .center)
            .foregroundColor(Color(UIColor(red: 0.252, green: 0.249, blue: 0.396, alpha: 1)))
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line()
    }
}
