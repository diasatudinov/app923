//
//  AwardUIView.swift
//  app923
//
//  Created by Dias Atudinov on 02.10.2024.
//

import SwiftUI

struct AwardUIView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    @State var isOption = false
    @State var showAddProductSheet = false
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .top) {
            Color.mainBg.ignoresSafeArea()
            
            VStack {
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
                    Text("Awards")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }.foregroundColor(.clear)
                }
                
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.awards, id: \.self) { award in
                        AwardCell(viewModel: viewModel, award: award)
                    }
                }.padding(.horizontal, 17)
                
                Button {
                    withAnimation {
                        isOption = true
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 66)
                            .cornerRadius(20)
                        Text("Option")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(.white)
                    }.padding(.horizontal, 17)
                }
            }.padding(.horizontal)
                
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showAddProductSheet = true
                    } label: {
                        ZStack {
                            Circle()
                                .frame(height: 60)
                                .cornerRadius(20)
                                .foregroundColor(.secondBg)
                            Image(systemName: "plus")
                                .font(.system(size: 25, weight: .regular))
                                .foregroundColor(.white)
                        }
                    }
                }.padding(.bottom, 100).padding(.horizontal, 33)
            }.sheet(isPresented: $showAddProductSheet, content: {
                NewAwardUIView(viewModel: viewModel, showAddProductSheet: $showAddProductSheet)
            })
            
            if isOption {
                ZStack {
                    Rectangle()
                        .foregroundColor(.black.opacity(0.5)).ignoresSafeArea()
                        .onTapGesture {
                            isOption = false
                        }
                    VStack {
                        Spacer()
                        ZStack {
                            Image("eventImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width - 70, height: 405)
                                
                                .cornerRadius(24)
                            
                            VStack {
                                HStack {
                                    Spacer()
                                    Button {
                                        isOption = false
                                    } label: {
                                        ZStack {
                                            Circle()
                                                .frame(height: 29)
                                                .foregroundColor(.white)
                                            Image(systemName: "xmark")
                                                .foregroundColor(.black)
                                        }
                                    }
                                }.padding(.horizontal, 48).padding(.top)
                                Spacer()
                                Button {
                                    isOption = false
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .frame(height: 66)
                                            .cornerRadius(20)
                                        Text("GO TO")
                                            .font(.system(size: 28, weight: .semibold))
                                            .foregroundColor(.white)
                                    }.padding(.horizontal, 65)
                                }.padding(.bottom, 20)
                                
                            }
                        }.frame(height: 405)
                        
                        Spacer()
                    }
                }
            }
            
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    AwardUIView(viewModel: SettingsViewModel())
}
