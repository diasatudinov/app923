//
//  NewProductUIView.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import SwiftUI

struct NewProductUIView: View {
    @ObservedObject var viewModel: CollectionViewModel
    @Binding var showAddProductSheet: Bool
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
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                    }
                }
                
                Spacer()
                
                Button {
                    if !name.isEmpty && !brand.isEmpty && !price.isEmpty {
                        if let image = selectedImage {
                            let product = Product(name: name, brand: brand, price: price, imageData: image.jpegData(compressionQuality: 1.0))
                            viewModel.addProduct(product)
                        } else {
                            let product = Product(name: name, brand: brand, price: price)
                            viewModel.addProduct(product)
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
    NewProductUIView(viewModel: CollectionViewModel(), showAddProductSheet: .constant(true))
}
