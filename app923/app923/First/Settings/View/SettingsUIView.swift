//
//  SettingsUIView.swift
//  app923
//
//  Created by Dias Atudinov on 17.09.2024.
//

import SwiftUI

struct SettingsUIView: View {
    @ObservedObject var viewModel: SettingsViewModel
    var body: some View {
        ZStack {
            Color.mainBg.ignoresSafeArea()
            
            VStack(spacing: 12) {
                
                HStack {
                    Text("Settings")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.bottom)
                
                
                Button {
                    viewModel.openUsagePolicy()
                } label: {
                    HStack(alignment: .top) {
                        Text("Usage Policy")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        Spacer()
                        
                        Image(systemName: "doc.text.magnifyingglass")
                            .foregroundColor(.blue)
                            .font(.system(size: 38))
                    }.padding().overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.blue, lineWidth: 2)
                    )
                }
                
                Button {
                    viewModel.rateApp()
                } label: {
                    HStack(alignment: .top) {
                        Text("Rate our app")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        Spacer()
                        
                        Image(systemName: "star.square")
                            .foregroundColor(.blue)
                            .font(.system(size: 38))
                    }.padding().padding(.vertical,4).overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.blue, lineWidth: 2)
                    )
                }
                
                Button {
                    viewModel.shareApp()
                } label: {
                    HStack(alignment: .top) {
                        Text("Share our app")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        Spacer()
                        
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.blue)
                            .font(.system(size: 38))
                    }.padding().overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.blue, lineWidth: 2)
                    )
                }
                
                NavigationLink {
                    AwardUIView(viewModel: viewModel)
                } label: {
                    HStack(alignment: .top) {
                        Text("Awards")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                        Spacer()
                        
                        Image(systemName: "medal.fill")
                            .foregroundColor(.mainBg)
                            .font(.system(size: 38))
                    }.padding().background(Color.blue).cornerRadius(16)
                        .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.blue, lineWidth: 2)
                    )
                }
                
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    SettingsUIView(viewModel: SettingsViewModel())
}
