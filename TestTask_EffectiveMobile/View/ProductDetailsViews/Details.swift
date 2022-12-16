//
//  Details.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct Details: View {
    
    var productDetail: DetailResponse
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image("outline_memory_black_36pt")
                            .foregroundColor(Color.init(hex: "#B7B7B7"))
                    Text(productDetail.CPU)
                            .font(SwiftUI.Font.footnote)
                            .foregroundColor(Color.init(hex: "#B7B7B7"))
                }
                .padding(.leading, 30)
                Spacer()
                VStack {
                    Image("outline_photo_camera_black_36pt")
                        .foregroundColor(Color.init(hex: "#B7B7B7"))
                    Text(productDetail.camera)
                        .font(SwiftUI.Font.footnote)
                        .foregroundColor(Color.init(hex: "#B7B7B7"))
                }
                Spacer()
                VStack {
                    Image("chip_memory_icon")
                        .foregroundColor(Color.init(hex: "#B7B7B7"))
                    Text(productDetail.ssd)
                        .font(SwiftUI.Font.footnote)
                        .foregroundColor(Color.init(hex: "#B7B7B7"))
                        .padding(.top, 5)
                }
                Spacer()
                VStack {
                    Image("outline_sd_storage_black_36pt")
                        .foregroundColor(Color.init(hex: "#B7B7B7"))
                    Text(productDetail.sd)
                        .font(SwiftUI.Font.footnote)
                        .foregroundColor(Color.init(hex: "#B7B7B7"))
                }
                .padding(.trailing, 30)
            }
            
        }
    }
}
