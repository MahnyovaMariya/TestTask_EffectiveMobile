//
//  ProductDetails.swift
//  TestTask_EffectiveMobile
//
//  Created by Мария on 09.12.2022.
//


import SwiftUI

struct ProductDetails: View {
  
    let sections = ["Shop", "Details", "Features"]
    
    @State private var onTap = false
    @State private var selectedButton = ""
    
//    @State private var productDetailsData: DetailResponse?
    
    @ObservedObject private var productDetailViewModel = ProductDetailViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1))
                VStack {
                    picturesGallery
                    Spacer()
                    ScrollView(.vertical, showsIndicators: false) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: UIScreen.main.bounds.size.width - 20, height: UIScreen.main.bounds.size.height / 2 , alignment: .center)
                                .foregroundColor(.white)
                            VStack {
                                titleInformation
                                starsBlock
                                sectionsBlock
                                additionalDataBlock
                                
                                HStack {
                                    colorBlock
                                    Spacer()
                                    capacityBlock
                                }
                                ZStack {
                                    NavigationLink(destination: MyCart(selectedProduct: productDetailViewModel.productDetailData /*?? ProductDetailsData(images: [], title: "", rating: 0.0, isFavorites: false, cpu: "", camera: "", ssd: "", sd: "", color: [], capacity: [], price: 0)*/)) {
                                        Rectangle()
                                            .frame(width: UIScreen.main.bounds.size.width - 50, height: 55, alignment: .center)
                                            .foregroundColor(Color.init(hex: "#FF6E4E"))
                                            .cornerRadius(10)
                                            .padding(.top, 20)
                                    }
                                    HStack {
                                        Text("Add to Cart")
                                            .foregroundColor(.white).fontWeight(Font.Weight.heavy)
                                            .padding(.top, 20)
                                            .padding(.leading, 80)
                                        Spacer()
                                        Text("$" + String(productDetailViewModel.productDetailData.price))
                                            
                                            .foregroundColor(.white).fontWeight(Font.Weight.heavy)
                                            .padding(.top, 20)
                                            .padding(.trailing, 80)
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                }.onAppear{
                    getProductDetailsData()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: buttonBack)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(alignment: .center) {
                    Spacer()
                    Text("Product Details")
                        .fontWeight(.bold)
                        .foregroundColor(Color.init(hex: "#010035"))
                        
                    Spacer()
                        Image("outline_shopping_bag_white_24pt")
                                .frame(width: 37, height: 37, alignment: .center)
                                .background(Color.init(hex: "#FF6E4E"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.trailing, 10)
                }
            }
        }
    }
    
    var picturesGallery: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.fixed(CGFloat((productDetailViewModel.productDetailData.images.count))))]) {
                ForEach(productDetailViewModel.productDetailData.images, id: \.self) { image in
                    ZStack {
                        AsyncImage(url: URL(string: image)) { image in
                            image.resizable()
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
    
    var titleInformation: some View {
        HStack {
            Text(productDetailViewModel.productDetailData.title)
                .font(SwiftUI.Font.title)
                .foregroundColor(Color.init(hex: "#010035"))
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: UIScreen.main.bounds.size.width / 10, height: UIScreen.main.bounds.size.width / 10, alignment: .center)
                    .foregroundColor(Color.init(hex: "#010035"))
                
                Image("outline_favorite_border_white_20pt")
                    .foregroundColor(Color.white)
            }
            .padding([.trailing], 30)
        }
        .padding([.top, .leading], 30)
    }
    
    var starsBlock: some View {
        HStack {
            ForEach(0...Int(round(productDetailViewModel.productDetailData.rating)), id: \.self) { _ in
                Image("baseline_star_rate_black_24pt")
                    .foregroundColor(Color.init(hex: "#FFB800"))
            }
            Spacer()
        }
        .padding(.leading, 30)
        .padding(.top, -10)
    }
    
    var sectionsBlock: some View {
        HStack {
            LazyHGrid(rows: [GridItem(.fixed(CGFloat(sections.count)))]) {
                ForEach(sections, id: \.self) {item in
                    VStack {
                        Button {
                            selectedButton = item
                        } label: {
                            Text(item)
                                .fontWeight(selectedButton == item ? .bold :  SwiftUI.Font.Weight.light)
                        }
                        .font(Font.title3)
                        .foregroundColor(selectedButton == item ? Color.init(hex: "#010035") : Color.init(hex: "#000000"))
                        .padding([.leading, .trailing], 30)
                        
                        Rectangle()
                            .frame(width: 100, height: 3, alignment: .center)
                            .foregroundColor(selectedButton == item ? Color.init(hex: "#FF6E4E") : .white)
                            .padding(.top, -10)
                    }
                }
            }.frame(width: 400, height: 50, alignment: .center)
        }
    }
    
    var additionalDataBlock: some View {
        VStack {
            HStack {
                Text("Select color and capacity")
                    .fontWeight(.bold)
                    .foregroundColor(Color.init(hex: "#010035"))
                    .padding(.leading, 30)
                    .padding(.top, 10)
                Spacer()
            }
            
                HStack {
                    VStack {
                        Image("outline_memory_black_36pt")
                            .foregroundColor(Color.init(hex: "#B7B7B7"))
                        Text(productDetailViewModel.productDetailData.CPU)
                            .font(SwiftUI.Font.footnote)
                            .foregroundColor(Color.init(hex: "#B7B7B7"))
                    }
                    .padding(.leading, 30)
                    Spacer()
                    VStack {
                        Image("outline_photo_camera_black_36pt")
                            .foregroundColor(Color.init(hex: "#B7B7B7"))
                        Text(productDetailViewModel.productDetailData.camera)
                            .font(SwiftUI.Font.footnote)
                            .foregroundColor(Color.init(hex: "#B7B7B7"))
                        
                    }
                    Spacer()
                    VStack {
                        Image("chip_memory_icon")
                            .foregroundColor(Color.init(hex: "#B7B7B7"))
                        Text(productDetailViewModel.productDetailData.ssd)
                            .font(SwiftUI.Font.footnote)
                            .foregroundColor(Color.init(hex: "#B7B7B7"))
                            .padding(.top, 5)
                    }
                    Spacer()
                    VStack {
                        Image("outline_sd_storage_black_36pt")
                            .foregroundColor(Color.init(hex: "#B7B7B7"))
                        Text(productDetailViewModel.productDetailData.sd)
                            .font(SwiftUI.Font.footnote)
                            .foregroundColor(Color.init(hex: "#B7B7B7"))
                    }
                    .padding(.trailing, 30)
                
            }
            
        }
    }
    
    var colorBlock: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.fixed(CGFloat(productDetailViewModel.productDetailData.color.count)))]) {
                    ForEach(productDetailViewModel.productDetailData.color, id: \.self) { item in
                        //вернуться
                            Button{
                                productDetailViewModel.selectedColor = item
                            } label: {
                                Image("baseline_done_black_24pt")
                                    .foregroundColor(productDetailViewModel.selectedColor == item ? .white : Color.init(hex: item))
                            }
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color.init(hex: item))
                            .clipShape(Circle())
                            .padding(.trailing, 10)
                    }
            }
        }
        .padding(.leading, 30)
    }
    
    var capacityBlock: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.fixed(CGFloat(productDetailViewModel.productDetailData.capacity.count)))]) {
                ForEach(productDetailViewModel.productDetailData.capacity, id: \.self) { item in
                    Button{
                        productDetailViewModel.selectedCapacity = item
                    } label: {
                        Text(item)
                            .foregroundColor(productDetailViewModel.selectedCapacity == item ? .white : Color.init(hex: "#8D8D8D"))
                    }
                    .fontWeight(Font.Weight.bold)
                    .frame(width: 70, height: 30, alignment: .center)
                    .background(productDetailViewModel.selectedCapacity == item ? Color.init(hex: "#FF6E4E") : .white)
                    .cornerRadius(10)
                    .padding(.trailing, 10)
                }
            }
        }
        .padding(.trailing, 30)
    }
    
    var buttonBack: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image("outline_arrow_back_ios_black_20pt")
                .frame(width: 37, height: 37, alignment: .center)
                .background(Color.init(hex: "#010035"))
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.leading, 10)
        }

    }

    func getProductDetailsData() {
        
        productDetailViewModel.loadProductDetailData()
        selectedButton = sections[0]
//        productDetailViewModel.selectedColor
//        ProductDetailsDataLoader().loadProductDetails { pdData in
//            productDetailsData = pdData
//
            
//        selectedColor = productDetailViewModel.productDetailData.color[0]
//            selectedCapacity = productDetailViewModel.productDetailData.capacity[0]
//        }
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails()
    }
}


