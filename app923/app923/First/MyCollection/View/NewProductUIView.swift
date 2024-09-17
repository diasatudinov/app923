//
//  NewProductUIView.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import SwiftUI

enum ProductType {
    case my, planned
}

struct NewProductUIView: View {
    @ObservedObject var viewModel: CollectionViewModel
    @Binding var showAddProductSheet: Bool
    @State var productType: ProductType
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    
    @State var name: String = ""
    @State var brand: String = ""
    @State var price: String = ""
    var body: some View {
        ZStack {
            Color.secondBg.ignoresSafeArea()
            VStack {
                Rectangle()
                    .frame(width: 36, height: 5)
                    .cornerRadius(3)
                    .foregroundColor(.gray.opacity(0.4))
                    .padding(10)
                
                HStack {
                    Spacer()
                    
                    Button {
                        showAddProductSheet = false
                    } label: {
                        
                        
                        ZStack {
                            Circle()
                                .frame(height: 30)
                                .foregroundColor(.gray.opacity(0.4))
                            
                            Image(systemName: "xmark")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            
                        }
                    }
                }
                
                HStack {
                    Text("Create a product")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.bottom, 30)
                
                if let image = selectedImage {
                    
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 96, height: 96)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5)
                    
                } else {
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 96, height: 96)
                            .foregroundColor(.black.opacity(0.15))
                            .cornerRadius(5)
                        Image(systemName: "photo")
                            .foregroundColor(.white)
                            .font(.title)
                    }.onTapGesture {
                        isShowingImagePicker = true
                    }
                    
                }
                
                HStack {
                    Text("Information")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.top, 30)
                VStack {
                    
                    ZStack(alignment: .leading) {
                        
                        if name.isEmpty {
                            Text("Name")
                                .foregroundColor(.white.opacity(0.5))
                                .padding()
                        }
                        
                        TextField("", text: $name)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                    }
                    
                    ZStack(alignment: .leading) {
                        
                        if brand.isEmpty {
                            Text("Brand")
                                .foregroundColor(.white.opacity(0.5))
                                .padding()
                        }
                        TextField("", text: $brand)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                    }
                    
                    ZStack(alignment: .leading) {
                        
                        if price.isEmpty {
                            Text("Price")
                                .foregroundColor(.white.opacity(0.5))
                                .padding()
                        }
                        TextField("", text: $price)
                            .keyboardType(.numberPad)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                    }
                }
                
                Spacer()
                
                Button {
                    if !name.isEmpty && !brand.isEmpty, let price = Double(price) {
                        if let image = selectedImage {
                            let product = Product(name: name, brand: brand, price: price, imageData: image.jpegData(compressionQuality: 1.0))
                            if productType == .my {
                                viewModel.addProduct(product)
                            } else {
                                viewModel.addPlannedProduct(product)
                            }
                        } else {
                            let product = Product(name: name, brand: brand, price: price)
                            if productType == .my {
                                viewModel.addProduct(product)
                            } else {
                                viewModel.addPlannedProduct(product)
                            }
                        }
                        showAddProductSheet = false
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 56)
                            .foregroundColor(.blueBtn)
                            .cornerRadius(12)
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        
                    }.opacity(!name.isEmpty && !brand.isEmpty && !price.isEmpty ? 1 : 0.3)
                }
            }.padding(.horizontal)
                .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                    ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
                }
        }
            
            
    }
        
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
           
        }
    }
        
}

#Preview {
    NewProductUIView(viewModel: CollectionViewModel(), showAddProductSheet: .constant(true), productType: .my)
}

#Preview {
    EditProductUIView(viewModel: CollectionViewModel(), showAddProductSheet: .constant(true), product: Product(name: "AAA", brand: "AAA", price: 20.0), productType: .my)
}

struct EditProductUIView: View {
    @ObservedObject var viewModel: CollectionViewModel
    @Binding var showAddProductSheet: Bool
    @State var product: Product
    @State var productType: ProductType

    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    
    @State var name: String = ""
    @State var brand: String = ""
    @State var price: String = ""
    
    var body: some View {
        ZStack {
            Color.secondBg.ignoresSafeArea()
            VStack {
                Rectangle()
                    .frame(width: 36, height: 5)
                    .cornerRadius(3)
                    .foregroundColor(.gray.opacity(0.4))
                    .padding(10)
                
                HStack {
                    Spacer()
                    
                    Button {
                        showAddProductSheet = false
                    } label: {
                        
                        
                        ZStack {
                            Circle()
                                .frame(height: 30)
                                .foregroundColor(.gray.opacity(0.4))
                            
                            Image(systemName: "xmark")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            
                        }
                    }
                }
                
                HStack {
                    Text("Edit a product")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.bottom, 30)
                
                if let image = selectedImage {
                    
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 96, height: 96)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5)
                        .onTapGesture {
                            isShowingImagePicker = true
                        }
                    
                } else {
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 96, height: 96)
                            .foregroundColor(.black.opacity(0.15))
                            .cornerRadius(5)
                        Image(systemName: "photo")
                            .foregroundColor(.white)
                            .font(.title)
                    }.onTapGesture {
                        isShowingImagePicker = true
                    }
                    
                }
                
                HStack {
                    Text("Information")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.top, 30)
                VStack {
                    
                    ZStack(alignment: .leading) {
                        
                        if name.isEmpty {
                            Text("Name")
                                .foregroundColor(.white.opacity(0.5))
                                .padding()
                        }
                        
                        TextField("", text: $name)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                    }
                    
                    ZStack(alignment: .leading) {
                        
                        if brand.isEmpty {
                            Text("Brand")
                                .foregroundColor(.white.opacity(0.5))
                                .padding()
                        }
                        TextField("", text: $brand)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                    }
                    
                    ZStack(alignment: .leading) {
                        
                        if price.isEmpty {
                            Text("Price")
                                .foregroundColor(.white.opacity(0.5))
                                .padding()
                        }
                        TextField("", text: $price)
                            .keyboardType(.numberPad)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                    }
                }
                
                Spacer()
                
                Button {
                    if !name.isEmpty && !brand.isEmpty, let price = Double(price) {
                        if productType == .my {
                            viewModel.editProduct(product, image: selectedImage, name: name, brand: brand, price: price)
                        } else {
                            viewModel.editPlannedProduct(product, image: selectedImage, name: name, brand: brand, price: price)
                        }
                        
                        showAddProductSheet = false
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 56)
                            .foregroundColor(.blueBtn)
                            .cornerRadius(12)
                        
                        Text("Edit")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        
                    }.opacity(!name.isEmpty && !brand.isEmpty && !price.isEmpty ? 1 : 0.3)
                }
                .onAppear {
                    selectedImage = product.image
                    name =  product.name
                    brand = product.brand
                    price = "\(product.price)"
                }
            }.padding(.horizontal)
                .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                    ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
                }
        }
            
            
    }
        
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
           
        }
    }
        
}
