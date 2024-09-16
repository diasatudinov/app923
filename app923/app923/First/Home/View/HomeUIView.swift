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
            VStack {
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
            }.padding(.horizontal)
        }
    }
}

#Preview {
    HomeUIView()
}
