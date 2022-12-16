//
//  PictureItem.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 15.12.2022.
//

import SwiftUI

struct PicturesGallery: View {
    
    var images: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.fixed(CGFloat((images.count))))]) {
                ForEach(images, id: \.self) { image in
                    ZStack {
                        AsyncImage(url: URL(string: image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: UIScreen.main.bounds.size.width * 0.4, height: UIScreen.main.bounds.size.height / 3, alignment: .center)
                    }
                }
                .frame(width: UIScreen.main.bounds.size.width * 0.6, height: UIScreen.main.bounds.size.height / 2 - 50, alignment: .center)
                .background(Color.white)
                .cornerRadius(15)
                .padding([.top, .leading, .trailing], 20)
                .shadow(color: Color(UIColor(red: 0.702, green: 0.701, blue: 0.761, alpha: 0.7)), radius: 10, x: 0, y: 8)
            }
        }
    }
}
