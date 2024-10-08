//
//  TabUIView.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import SwiftUI

struct TabUIView: View {
    @State var selectedTab = 0
    private let tabs = ["Home", "Attractions", "Memories", "Settings"]
    
    @ObservedObject var collectionVM = CollectionViewModel()
    @ObservedObject var settingsVM = SettingsViewModel()
    var body: some View {
        ZStack {
            
            switch selectedTab {
            case 0:
                HomeUIView(viewModel: collectionVM)
            case 1:
                MyCollectionUIView(viewModel: collectionVM)
            case 2:
                PlannedUIView(viewModel: collectionVM)
            case 3:
               SettingsUIView(viewModel: settingsVM)
            default:
                Text("default")
            }
                VStack {
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.secondBg)
                            .frame(height: 80)
                            
                        HStack(spacing: 50) {
                            ForEach(0..<tabs.count) { index in
                                Button(action: {
                                    selectedTab = index
                                }) {
                                    
                                    ZStack {
                                        VStack {
                                            Image(systemName: icon(for: index))
                                                .font(.system(size: 20, weight: .semibold))
                                                .padding(.bottom, 2)
                                            Text(text(for: index))
                                                .font(.system(size: 10, weight: .semibold))
                                        }.foregroundColor(selectedTab == index ? Color.blue : Color.white.opacity(0.7))
                                    }
                                }
                                
                            }
                        }.padding(.bottom, 5)
                    
                    }
                    
                }.ignoresSafeArea()
            
        }
    }
    
    private func icon(for index: Int) -> String {
        switch index {
        case 0: return "house"
        case 1: return "wand.and.stars.inverse"
        case 2: return "lasso.badge.sparkles"
        case 3: return "gearshape"
        default: return ""
        }
    }
    
    private func text(for index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "My collection"
        case 2: return "Planned"
        case 3: return "Settings"
        default: return ""
        }
    }
}

#Preview {
    TabUIView()
}
