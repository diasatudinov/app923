//
//  HomeUIView.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import SwiftUI

struct HomeUIView: View {
    @ObservedObject var viewModel: CollectionViewModel
    var body: some View {
        ZStack {
            Color.mainBg.ignoresSafeArea()
            VStack(spacing: 30) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.secondBg)
                        .cornerRadius(16)
                    VStack {
                        HStack {
                            Text("General expenses")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold))
                            Spacer()
                        }
                        MultiColoredProgressView(totalCost: viewModel.totalCollectionPrice(), popularCost: viewModel.totalPopularPrice(), plannedCost: viewModel.totalPlannedPrice())
                        VStack(spacing: 20) {
                            HStack(spacing: 50) {
                                Circle()
                                    .frame(width: 26)
                                
                                Text("- \(String(format: "%.2f", viewModel.totalCollectionPrice())) $")
                                    .font(.system(size: 28))
                                    Spacer()
                            }.foregroundColor(viewModel.totalCollectionPrice() != 0 ? /*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/ : .grayOff)
                            
                            HStack(spacing: 50) {
                                Circle()
                                    .frame(width: 26)
                                
                                Text("- \(String(format: "%.2f", viewModel.totalPopularPrice())) $")
                                    .font(.system(size: 28))
                                    Spacer()
                            }.foregroundColor(viewModel.totalPopularPrice() != 0 ? .purplePopular : .grayOff)
                            
                            HStack(spacing: 50) {
                                Circle()
                                    .frame(width: 26)
                                
                                Text("- \(String(format: "%.2f", viewModel.totalPlannedPrice())) $")
                                    .font(.system(size: 28))
                                    Spacer()
                            }.foregroundColor(viewModel.totalPlannedPrice() != 0 ? .greenPlanned : .grayOff)
                        }
                    }.padding(.horizontal,12)
                }
                    .frame(height: 250)
                
                HStack {
                    
                    VStack {
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(viewModel.totalCollectionPrice() != 0 ? .blue : .grayOff)
                                .cornerRadius(5)
                            
                            VStack(spacing: 8) {
                                Text("All collection")
                                    .font(.system(size: 20, weight: .semibold))
                                Text("\(String(format: "%.0f", viewModel.totalCollectionPrice())) $")
                                    .font(.system(size: 34, weight: .bold))
                            }.foregroundColor(.white)
                        }.frame(height: 133)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(viewModel.totalPlannedPrice() != 0 ? .greenPlanned : .grayOff)
                                .cornerRadius(5)
                            
                            VStack(spacing: 8) {
                                Text("Planned")
                                    .font(.system(size: 20, weight: .semibold))
                                Text("\(String(format: "%.0f", viewModel.totalPlannedPrice())) $")
                                    .font(.system(size: 34, weight: .bold))
                            }.foregroundColor(.white)
                        }.frame(height: 133)
                    }
                    
                    VStack {
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(viewModel.totalPopularPrice() != 0 ? .purplePopular : .grayOff)
                                .cornerRadius(5)
                            
                            VStack(spacing: 8) {
                                Text("Popular")
                                    .font(.system(size: 20, weight: .semibold))
                                Text("\(String(format: "%.0f", viewModel.totalPopularPrice())) $")
                                    .font(.system(size: 34, weight: .bold))
                            }.foregroundColor(.white)
                        }.frame(height: 133)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(viewModel.averageCost() != 0 ? .secondBg : .grayOff)
                                .cornerRadius(5)
                            
                            VStack(spacing: 8) {
                                Text("Average product cost")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20, weight: .semibold))
                                Text("\(String(format: "%.2f", viewModel.averageCost())) $")
                                    .font(.system(size: 34, weight: .bold))
                            }.foregroundColor(.white)
                        }.frame(height: 133)
                    }
                    
                }.frame(height: 274)
                
                
            }.padding(.horizontal).padding(.bottom, 50)
        }
    }
}

#Preview {
    HomeUIView(viewModel: CollectionViewModel())
}
