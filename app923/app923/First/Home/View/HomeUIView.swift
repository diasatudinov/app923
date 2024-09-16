//
//  HomeUIView.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import SwiftUI

struct HomeUIView: View {
    
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
                        MultiColoredProgressView(totalCost: 0, popularCost: 0, plannedCost: 0)
                        VStack(spacing: 20) {
                            HStack(spacing: 50) {
                                Circle()
                                    .frame(width: 26)
                                
                                Text("- 0$")
                                    .font(.system(size: 28))
                                    Spacer()
                            }.foregroundColor(true ? /*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/ : .grayOff)
                            
                            HStack(spacing: 50) {
                                Circle()
                                    .frame(width: 26)
                                
                                Text("- 0$")
                                    .font(.system(size: 28))
                                    Spacer()
                            }.foregroundColor(true ? .purplePopular : .grayOff)
                            
                            HStack(spacing: 50) {
                                Circle()
                                    .frame(width: 26)
                                
                                Text("- 0$")
                                    .font(.system(size: 28))
                                    Spacer()
                            }.foregroundColor(true ? .greenPlanned : .grayOff)
                        }
                    }.padding(.horizontal,12)
                }
                    .frame(height: 250)
                
                HStack {
                    
                    VStack {
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(true ? .blue : .grayOff)
                                .cornerRadius(5)
                            
                            VStack(spacing: 8) {
                                Text("All collection")
                                    .font(.system(size: 20, weight: .semibold))
                                Text("250 $")
                                    .font(.system(size: 34, weight: .bold))
                            }.foregroundColor(.white)
                        }.frame(height: 133)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(true ? .greenPlanned : .grayOff)
                                .cornerRadius(5)
                            
                            VStack(spacing: 8) {
                                Text("Planned")
                                    .font(.system(size: 20, weight: .semibold))
                                Text("335 $")
                                    .font(.system(size: 34, weight: .bold))
                            }.foregroundColor(.white)
                        }.frame(height: 133)
                    }
                    
                    VStack {
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(true ? .purplePopular : .grayOff)
                                .cornerRadius(5)
                            
                            VStack(spacing: 8) {
                                Text("Popular")
                                    .font(.system(size: 20, weight: .semibold))
                                Text("125 $")
                                    .font(.system(size: 34, weight: .bold))
                            }.foregroundColor(.white)
                        }.frame(height: 133)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(true ? .secondBg : .grayOff)
                                .cornerRadius(5)
                            
                            VStack(spacing: 8) {
                                Text("Average product cost")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20, weight: .semibold))
                                Text("20,8 $")
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
    HomeUIView()
}
