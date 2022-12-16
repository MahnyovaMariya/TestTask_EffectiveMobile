//
//  ContentView.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 05.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    //убрать Mark Pro
    
    let categories: [CategoriesData] = [
        CategoriesData(name: "Phones", image: "outline_phone_iphone_black_36pt"),
        CategoriesData(name: "Tablets", image: "outline_tablet_mac_black_36pt"),
        CategoriesData(name: "TV", image: "outline_tv_black_36pt"),
        CategoriesData(name: "Smart toys", image: "outline_smart_toy_black_36pt"),
        CategoriesData(name: "Headphones", image: "outline_headphones_black_36pt"),
        CategoriesData(name: "Gamepads", image: "outline_gamepad_black_36pt"),
        CategoriesData(name: "Watch", image: "outline_watch_black_36pt")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let rows = [GridItem(.fixed(8.0))]
    
//    @State var counter = 0
    @State private var like = false
//    @State private var x = false
    @State var selected: CategoriesData?
    @State private var selectedHeart: BestSellerDataModel?
//    @State private var selectedHearts = [SelectedHeart]()
    @State private var isShowFilter = false
    
    @ObservedObject private var contentViewViewModel = ContentViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        ZStack {
                            Color(UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1))
                            VStack {
                                filterImg
                                categorySection
                                SearchSection()
                                hotSalesSection
                                bestSellerSection
                                Spacer()
                            }
                        }.onAppear{ getData() }
                    }
                    TapBar()
                }
                .padding([.leading, .trailing], 10)
                .background(Color(UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)))
                FilterOptions(isButtonTap: $isShowFilter)
            }
        }
    }
    
    var filterImg: some View {
        HStack{
            Spacer()
            Button {
                isShowFilter.toggle()
            } label: {
                Image("outline_filter_alt_black_18pt")
                    .padding(10)
                    .foregroundColor(Color.init(hex: "#010035"))
            }
        }
    }
    
    var categorySection: some View {
        VStack {
            Section(categoryTitle: "Select Category", goTo: "view all")
            categoriesGallery
        }
    }
    
    var hotSalesSection: some View {
        VStack {
            Section(categoryTitle: "Hot sales", goTo: "see more")
            hotSalesGallery
        }
    }
    
    var bestSellerSection: some View {
        VStack {
            Section(categoryTitle: "Best Seller", goTo: "see more")
            bestSellerGallery
        }
    }
    
    var categoriesGallery: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(categories, id: \.self) { category in
                    CategoryItem(item: category, selected: $selected)
                }
            }.frame(height: 100, alignment: .center)
        }
    }

    var hotSalesGallery: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.fixed(CGFloat(/*hotSalesData.count*/contentViewViewModel.hotSalesData.count)))]) {
                ForEach(/*hotSalesData*/contentViewViewModel.hotSalesData, id: \.self) { hotSalesDataItem in
                    HotSalesItem(picture: hotSalesDataItem.picture, is_new: hotSalesDataItem.is_new, title: hotSalesDataItem.title, subtitle: hotSalesDataItem.subtitle)
                }.frame(width: UIScreen.main.bounds.size.width - 20, height: UIScreen.main.bounds.size.width * 1.5, alignment: .leading)
            }
        }.frame(height: 250, alignment: .center)
    }

    var bestSellerGallery: some View {
        LazyVGrid(columns: columns){
            ForEach(contentViewViewModel.bestSellerData, id:\.self) { bestSellerDataItem in
                BestSellerItem(bestSellerDataItem: bestSellerDataItem, selectedHeart: $selectedHeart)
            }
        }
        .padding([.leading, .trailing], 17)
    }

    func getData() {
        selected = categories[0]
        contentViewViewModel.loadData()
//        for i in 0..<contentViewViewModel.bestSellerData.count {
//            selectedHearts.append(SelectedHeart(id: contentViewViewModel.bestSellerData[i].id, isSelected: false))
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
