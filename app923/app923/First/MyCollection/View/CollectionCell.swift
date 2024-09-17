//
//  CollectionCell.swift
//  app923
//
//  Created by Dias Atudinov on 17.09.2024.
//

import SwiftUI



struct CollectionCell: View {
    @ObservedObject var viewModel: CollectionViewModel
    @State var product: Product
    
    @State private var showEditProductSheet = false
    @State private var showAlert = false
    var body: some View {
        ZStack {
            
            Color.secondBg
            VStack {
                
                HStack {
                    Spacer()
                    
                    Image(systemName: "ellipsis.circle.fill")
                        .resizable()
                        .foregroundColor(.white.opacity(0.12))
                        .frame(width: 27, height: 27)
                        .contextMenu {
                            Button(action: {
                                // Edit action
                                showEditProductSheet = true
                            }) {
                                Text("Edit")
                                Image(systemName: "pencil")
                            }
                            
                            Button(action: {
                                // Delete action
                                showAlert = true
                                
                            }) {
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                        }
                    
                }.padding(.bottom, 10)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Delete a product"),
                            message: Text("This product will be removed off the list forever"),
                            primaryButton: .destructive(Text("Delete")) {
                                // Add delete logic here
                                viewModel.deleteProduct(product)
                            },
                            secondaryButton: .cancel()
                        )
                    }
                
                if let image = product.image {
                    
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 2 - 48, height: 140)
                        .cornerRadius(5)
                } else {
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width / 2 - 48, height: 140)
                            .foregroundColor(.black.opacity(0.15))
                            .cornerRadius(5)
                        Image(systemName: "photo")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                    }
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .font(.system(size: 15, weight: .semibold))
                        Text(product.brand)
                            .font(.system(size: 14))
                            .padding(.bottom, 10)
                        Text("\(String(format: "%.2f", product.price)) $")
                            .font(.system(size: 16, weight: .semibold))
                    }.foregroundColor(.white)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            viewModel.togglePopular(product)
                        }
                    } label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 16)
                            .foregroundColor(product.isPopular ? .red : .gray)
                    }
                    
                        
                }
                
            }.padding(5).padding(.vertical, 5)
            
        }.frame(height: 349).cornerRadius(5)
            .sheet(isPresented: $showEditProductSheet, content: {
                EditProductUIView(viewModel: viewModel, showAddProductSheet: $showEditProductSheet, product: product, productType: .my)
            })
    }
}

#Preview {
    CollectionCell(viewModel: CollectionViewModel(), product: Product(name: "WELLA", brand: "FLEX Hairspray \nMEN MEGA SPRAY", price: 5.0, isPopular: false))
}
