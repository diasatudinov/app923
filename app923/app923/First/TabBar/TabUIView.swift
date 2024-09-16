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
    

//    @ObservedObject var attractionVM = AttractionViewModel()
//    @ObservedObject var settingsVM = SettingsViewModel()
    var body: some View {
        ZStack {
            
            switch selectedTab {
            case 0:
                //HomeUIView(viewModel: attractionVM, settingsVM: settingsVM, tabNum: $selectedTab)
                    Text("View 1")
            case 1:
                //AttractionsUIView(viewModel: attractionVM, settingsVM: settingsVM)
                Text("View 2")
            case 2:
               // MemoriesUIView(viewModel: attractionVM, settingsVM: settingsVM, tabNum: $selectedTab)
                Text("View 3")
            case 3:
              // SettingsUIView(viewModel: settingsVM)
                Text("View 4")
            default:
                Text("default")
            }
                VStack {
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.mainBg)
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
                        
                        Rectangle()
                            .fill(Color.black)
                            .frame(height: 1)
                            .padding(.bottom, 78)
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
