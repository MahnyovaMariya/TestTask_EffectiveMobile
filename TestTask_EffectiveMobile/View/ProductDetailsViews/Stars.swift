//
//  Stars.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct Stars: View {
    
    var rating: Double
    
    var body: some View {
        HStack {
            ForEach(0...Int(round(rating)), id: \.self) { _ in
                Image("baseline_star_rate_black_24pt")
                    .foregroundColor(Color.init(hex: "#FFB800"))
            }
            Spacer()
        }
        .padding(.leading, 30)
        .padding(.top, -10)
    }
}
