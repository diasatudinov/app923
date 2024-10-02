//
//  AwardDetailsUIView.swift
//  app923
//
//  Created by Dias Atudinov on 02.10.2024.
//

import SwiftUI

struct AwardDetailsUIView: View {
    @ObservedObject var viewModel: SettingsViewModel

    @State var award: Award
    @State var showEditAwardSheet = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .top) {
            Color.mainBg.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }.foregroundColor(.blue)
                    }
                    Spacer()
                    Text(award.name)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    HStack {
                        Button {
                            showEditAwardSheet = true
                        } label: {
                            Image(systemName: "pencil")
                        }
                       
                        Button {
                            viewModel.deleteAward(award)
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "trash.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
                
                ZStack {
                    if let image = award.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 328)
                            .cornerRadius(10)
                            .allowsHitTesting(false)
                    } else {
                        Rectangle()
                            .frame(height: 328)
                            .cornerRadius(10)
                            .foregroundColor(.gray.opacity(0.5))
                        
                       
                    }
                    
                    VStack{
                        HStack {
                            Text(formattedTime(time: award.date))
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(6).padding(.horizontal, 5)
                                .background(Color.mainBg)
                                .cornerRadius(6)
                                .padding(20)
                            Spacer()
                        }
                        Spacer()
                    }
                    
                } .frame(height: 328)
                
                Text(award.name)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                
                Text(award.title)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(12)
                
                Spacer()
                
                Button {
                    viewModel.awardCheckToggle(award)
                    award.isChecked.toggle()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 56)
                            .foregroundColor(.eventButtonBlue)
                            .cornerRadius(12)
                        Text(award.isChecked ? "Completed" : "Complete")
                            .foregroundColor(.white)
                    }
                }
            }.padding(.horizontal)
                .onAppear {
                    award = award
                }
            
        }.navigationBarBackButtonHidden()
            .sheet(isPresented: $showEditAwardSheet, content: {
                EditAwardUIView(viewModel: viewModel, showAddProductSheet: $showEditAwardSheet, award: award)
            })
    }
    private func formattedTime(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: time)
    }
}

#Preview {
    AwardDetailsUIView(viewModel: SettingsViewModel(), award: Award(name: "The most brilliant beard", title: "Win a competition among other friends, take care of your vegetation and win", date: Date()))
}
