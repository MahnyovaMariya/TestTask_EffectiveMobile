//
//  Delivery.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct Delivery: View {
    
    var body: some View {
        HStack {
            Text("Delivery")
                .foregroundColor(.white)
                .padding(.top, 10)
                .padding(.leading, 40)
            Spacer()
            Text("Free")
                .foregroundColor(.white)
                .font(Font.headline)
                .bold()
                .padding(.top, 10)
                .padding(.trailing, 60)
        }
    }
}

struct Delivery_Previews: PreviewProvider {
    static var previews: some View {
        Delivery()
    }
}
