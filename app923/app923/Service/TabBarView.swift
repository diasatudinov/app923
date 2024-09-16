//
//  TabBarView.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import SwiftUI

struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["My collection", "Popular"]
    var body: some View {
       
            HStack {
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                        id: \.0,
                        content: {
                    index, name in
                    TabBarItem(currentTab: self.$currentTab,
                               namespace: namespace.self,
                               tabBarItemName: name,
                               tab: index).foregroundColor(.white)
                    
                    
                })
            }//.frame(maxWidth: .infinity)
            .padding(.horizontal)
        
        .background(Color.clear)
        .frame(height: 100)
        .edgesIgnoringSafeArea(.all)
    }
}
