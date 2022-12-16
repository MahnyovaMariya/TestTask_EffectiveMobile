//
//  ProductDetails.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 09.12.2022.
//


import SwiftUI

struct ProductDetails: View {
  
    let sections = ["Shop", "Details", "Features"]
    @State private var selectedButton = ""
    @ObservedObject private var productDetailViewModel = ProductDetailViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1))
                VStack {
                    PicturesGallery(images: productDetailViewModel.productDetailData.images)
                    Spacer()
                    ScrollView(.vertical, showsIndicators: false) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: UIScreen.main.bounds.size.width - 20, height: UIScreen.main.bounds.size.height / 2 , alignment: .center)
                                .foregroundColor(.white)
                            VStack {
                                Title(title: productDetailViewModel.productDetailData.title)
                                Stars(rating: productDetailViewModel.productDetailData.rating)
                                sectionsBlock
                                Details(productDetail: productDetailViewModel.productDetailData)
                                HStack {
                                    Text("Select color and capacity")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.init(hex: "#010035"))
                                        .padding(.leading, 30)
                                        .padding(.top, 10)
                                    Spacer()
                                }
                                HStack {
                                    ColorBlock(colors: productDetailViewModel.productDetailData.color, selectedColor: $productDetailViewModel.selectedColor)
                                    Spacer()
                                    CapacityBlock(capacities: productDetailViewModel.productDetailData.capacity, selectedCapacity: $productDetailViewModel.selectedCapacity)
                                }
                                AddButton(productDetailData: productDetailViewModel.productDetailData)
                                Spacer()
                            }
                        }
                    }
                }
                .onAppear{
                    getProductDetailsData()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: buttonBack)
        .toolbar {
            ToolbarItem(placement: .principal) {
                ToolBar(text: "Product Details", picture: "outline_shopping_bag_white_24pt")
            }
        }
    }
    
    var sectionsBlock: some View {
        HStack {
            LazyHGrid(rows: [GridItem(.fixed(CGFloat(sections.count)))]) {
                ForEach(sections, id: \.self) {item in
                    ShopSection(selectedButton: $selectedButton, item: item)
                }
            }.frame(width: 400, height: 50, alignment: .center)
        }
    }
    
    var buttonBack: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: { LabelBackButton() }
    }

    func getProductDetailsData() {
        productDetailViewModel.loadProductDetailData()
        selectedButton = sections[0]
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails()
    }
}


