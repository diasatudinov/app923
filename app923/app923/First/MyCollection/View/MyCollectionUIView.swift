//
//  MyCollectionUIView.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import SwiftUI

struct MyCollectionUIView: View {
    @ObservedObject var viewModel: CollectionViewModel
    @State var currentTab = 0
    @State var showAddProductSheet = false
    var body: some View {
        ZStack(alignment: .top) {
            Color.mainBg.ignoresSafeArea()
            TabView(selection: $currentTab) {
                MyCollection(viewModel: viewModel).tag(0)
                Popular().tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            TabBarView(currentTab: self.$currentTab)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showAddProductSheet = true
                    } label: {
                        ZStack {
                            Circle()
                                .frame(height: 60)
                                .foregroundColor(.blueBtn)
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                            
                        }
                    }
                }
            }.padding(.horizontal).padding(.bottom, 100)
            
        }.sheet(isPresented: $showAddProductSheet, content: {
            NewProductUIView(viewModel: viewModel, showAddProductSheet: $showAddProductSheet)
        })
    }
}

#Preview {
    MyCollectionUIView(viewModel: CollectionViewModel())
}


struct MyCollection: View {
    @ObservedObject var viewModel: CollectionViewModel
    var body: some View {
        ZStack {
            Color.mainBg.ignoresSafeArea()
            VStack {
                if viewModel.products.isEmpty {
                    VStack {
                        Text("Your collection is empty")
                            .font(.system(size: 22, weight: .bold))
                        Text("Create new products by clicking on (+) ")
                            .opacity(0.7)
                        
                        Image(systemName: "wand.and.stars.inverse")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 120)
                            .opacity(0.12)
                    }.foregroundColor(.white)
                } else {
                    ScrollView {
                        ForEach(viewModel.products, id: \.self) { product in
                            Text(product.name)
                            
                            
                        }
                        
                    }
                }
                
                
                
            }.padding(.horizontal).padding(.bottom, 50)
            
            
        }
    }
}

struct Popular: View {
    var body: some View {
        ZStack {
            Color.mainBg.ignoresSafeArea()
            VStack {
                
                ScrollView {
                    
                    
                }
                
                
                
                
            }.padding(.horizontal).padding(.bottom, 50)
            
            
        }
    }
}
