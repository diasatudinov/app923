//
//  ContentView.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        VStack {
            MultiColoredProgressView(totalCost: 350, popularCost: 525, plannedCost: 935)
                .padding()
            
            Text("Progress with Blue (Total), Red (Popular), Green (Planned)")
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
    }
}

#Preview {
    ContentView()
}
