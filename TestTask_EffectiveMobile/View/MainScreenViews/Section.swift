//
//  Section.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct Section: View {
    
    var categoryTitle: String
    var goTo: String
    
    var body: some View {
        HStack {
            Text(categoryTitle)
            
                .padding(10)
                .font(.system( size: 25))
                .bold()
                .foregroundColor(Color.init(hex: "#010035"))
            
            Spacer()
            
            Text(goTo)
                .padding(10)
                .font(Font.custom("Mark Pro", size: 15, relativeTo: SwiftUI.Font.TextStyle.callout))
                .foregroundColor(Color.init(hex: "#FF6E4E"))
            
        }
    }
}

//struct Section_Previews: PreviewProvider {
//    static var previews: some View {
//        Section(categoryTitle: "Title", goTo: <#String#>)
//    }
//}
