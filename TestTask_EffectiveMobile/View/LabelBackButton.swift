//
//  BackButton.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct LabelBackButton: View {
    
    var body: some View {
        Image("outline_arrow_back_ios_black_20pt")
            .frame(width: 37, height: 37, alignment: .center)
            .background(Color.init(hex: "#010035"))
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.leading, 10)
    }
}

struct LabelBackButton_Previews: PreviewProvider {
    static var previews: some View {
        LabelBackButton()
    }
}
