//
//  CustomProgressView.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import SwiftUI

struct MultiColoredProgressView: View {
    var totalCost: Double
    var popularCost: Double
    var plannedCost: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                HStack {
                    // Planned collection (green)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.grayOff)
                        .frame(width:geometry.size.width - 25, height: 10)
                }
                
                HStack {
                    // Planned collection (green)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.greenPlanned)
                        .frame(width: widthForCost(cost: plannedCost, geometry: geometry), height: 10)
                        .padding(.leading, widthForCost(cost: popularCost, geometry: geometry) + widthForCost(cost: totalCost, geometry: geometry) - 25)
                }
                
                
                
                HStack {
                    // Popular collection (red)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.purplePopular)
                        .frame(width: widthForCost(cost: popularCost, geometry: geometry), height: 10)
                        .padding(.leading, widthForCost(cost: totalCost, geometry: geometry) - 15)
                    
                }
                
                // Full collection (blue)
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: widthForCost(cost: totalCost, geometry: geometry), height: 10)
                }
               
            }
            .cornerRadius(10)
        }
        .frame(height: 20) // Set the height of the progress bar
    }
    
    // Calculate the width of each segment based on the total width
    private func widthForCost(cost: Double, geometry: GeometryProxy) -> CGFloat {
        var total = 0.0
        total = totalCost + popularCost + plannedCost
        if total == 0 {
            return 0 // Prevent division by zero
        }
        
        return CGFloat(cost / total) * geometry.size.width
        
        
    }
    
    
}
