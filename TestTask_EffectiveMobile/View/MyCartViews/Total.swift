//
//  Total.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct Total: View {
    
    var total: Int
    
    var body: some View {
        HStack {
            Text("Total")
                .foregroundColor(.white)
                .padding(.top, 10)
                .padding(.leading, 40)
            Spacer()
            Text("$" + String(total))
                .foregroundColor(.white)
                .font(Font.headline)
                .bold()
                .padding(.top, 10)
            Text("US")
                .foregroundColor(.white)
                .font(Font.footnote)
                .bold()
                .padding(.top, 10)
                .padding(.trailing, 20)
        }
    }
}

struct Total_Previews: PreviewProvider {
    static var previews: some View {
        Total(total: 1000)
    }
}
