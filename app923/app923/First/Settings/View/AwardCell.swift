//
//  AwardCell.swift
//  app923
//
//  Created by Dias Atudinov on 02.10.2024.
//

import SwiftUI

struct AwardCell: View {
    @ObservedObject var viewModel: SettingsViewModel

    @State var award: Award
    var body: some View {
        ZStack {
            award.isChecked ? .cellCheckedBlue : Color.secondBg
            
            HStack(spacing: 12) {
                if let image = award.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        
                        .cornerRadius(10)
                } else {
                    Rectangle()
                        .frame(width: 90, height: 90)
                        .cornerRadius(10)
                        .foregroundColor(.gray.opacity(0.5))
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(award.name)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.bottom, 2)
                    Text(formattedTime(time: award.date))
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(6).padding(.horizontal, 5)
                        .background(Color.mainBg)
                        .cornerRadius(6)
                    
                    NavigationLink {
                        AwardDetailsUIView(viewModel: viewModel, award: award)
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(height: 36)
                                .cornerRadius(6)
                                .foregroundColor(.blue)
                            Text("Open")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                }
            }.padding(.horizontal)
        }.frame(height: 122).cornerRadius(12)
    }
    
    private func formattedTime(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: time)
    }
}

#Preview {
    AwardCell(viewModel: SettingsViewModel(), award: Award(name: "The most brilliant beard", title: "Win a competition among other friends, take care of your vegetation and win", date: Date()))
}
