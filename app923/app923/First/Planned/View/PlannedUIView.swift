//
//  PlannedUIView.swift
//  app923
//
//  Created by Dias Atudinov on 17.09.2024.
//

import SwiftUI

struct PlannedUIView: View {
    @ObservedObject var viewModel: CollectionViewModel
    @State var currentTab = 0
    @State var showAddProductSheet = false
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        ZStack(alignment: .top) {
            Color.mainBg.ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Planned")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                }
                if viewModel.plannedProducts.isEmpty {
                    VStack {
                        Spacer()
                        Text("You don't have any products in your plans")
                            .font(.system(size: 22, weight: .bold))
                        Text("Create new products by clicking on (+) ")
                            .opacity(0.7)
                        
                        Image(systemName: "lasso.badge.sparkles")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 120)
                            .opacity(0.12)
                        Spacer()
                    }.foregroundColor(.white).multilineTextAlignment(.center)
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(viewModel.plannedProducts, id: \.self) { product in
                              
                                PlannedProductCell(viewModel: viewModel, product: product).padding(.horizontal,2)
                                
                            }
                        }
                        
                        
                    }
                }
                
                
                
            }.padding(.horizontal).padding(.bottom, 50)
            
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
            NewProductUIView(viewModel: viewModel, showAddProductSheet: $showAddProductSheet, productType: .planned)
        })
    }
}

#Preview {
    PlannedUIView(viewModel: CollectionViewModel())
}

