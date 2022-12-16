//
//  DownLayer.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct DownLayer: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("My Cart")
                    .foregroundColor(Color.init(hex: "#010035"))
                    .font(Font.largeTitle)
                    .bold()
                Spacer()
            }
            .padding(.leading, 40)
            .padding(.top, 60)
            Spacer()
            RoundedRectangle(cornerRadius: 30)
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 2 / 3, alignment: .center)
                .foregroundColor(Color.init(hex: "#010035"))
        }
    }
}

struct DownLayer_Previews: PreviewProvider {
    static var previews: some View {
        DownLayer()
    }
}
