//
//  UsOnboardingUIView.swift
//  app923
//
//  Created by Dias Atudinov on 16.09.2024.
//

import SwiftUI
import StoreKit

struct UsOnboardingUIView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true
    @State private var isNotificationView: Bool = true
    @State private var pageNum: Int = 1
    @AppStorage("onboardingShowed") var onboardingShowed: Bool = false

    var body: some View {
        if !onboardingShowed {
            if pageNum < 3 {
                ZStack {
                    Color.mainBg
                        .ignoresSafeArea()
                    
                    ZStack {
                        VStack {
                            Spacer()
                            switch pageNum {
                            case 1:
                                
                                    Image("logo2923")
                                    .padding(.top, 100)
                                
                            case 2: Image("ratings923")
                                    //.resizable()
                                    .aspectRatio(contentMode: .fit)
                            default:
                                Image("notifications874")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 500)
                                    .ignoresSafeArea()
                            }
                            
                            ZStack {
                                VStack {
                                    Spacer()
                                    Rectangle()
                                        .foregroundColor(.secondBg).edgesIgnoringSafeArea(.bottom)
                                        .frame(height: 300)
                                }
                                VStack {
                                    Spacer()
                            switch pageNum {
                            case 1:
                                VStack(spacing: 12) {
                                    Text("Start now and earn more")
                                        .font(.system(size: 28, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .multilineTextAlignment(.center)
                                    Text("A proven way to make easy money")
                                        .font(.system(size: 15, weight: .semibold))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.gray.opacity(0.5))
                                    
                                }.frame(height: 160).padding(.bottom, 10).padding(.horizontal, 30).foregroundColor(.white)
                                
                            case 2:
                                VStack(spacing: 12) {
                                    Text("Rate our app in the \nAppStore")
                                        .font(.system(size: 28, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .multilineTextAlignment(.center)
                                    Text("Help make the app even better")
                                        .font(.system(size: 15, weight: .semibold))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.gray.opacity(0.5))
                                }.frame(height: 160).padding(.bottom, 10).padding(.horizontal, 30).foregroundColor(.white)
                                    .onAppear{
                                        rateApp()
                                    }
                            default:
                                Text("Don’t miss anything")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 10)
                                Text("Don’t miss the most userful information")
                                    .foregroundColor(.white).opacity(0.7)
                                
                            }
                            
                                    Button {
                                        if pageNum < 3 {
                                            pageNum += 1
                                        } else {
                                        }
                                    } label: {
                                        Text("Next")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 15))
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                    }.frame(height: 50).background(Color.blueBtn)
                                        .cornerRadius(16).padding(.horizontal).padding(.top, 32)
                                    
                                    HStack(spacing: 8) {
                                        Circle()
                                            .fill(pageNum == 1 ? Color.blueBtn : Color.blueBtn.opacity(0.5))
                                            .frame(width: 8, height: 8)
                                            .cornerRadius(19)
                                        
                                        Circle()
                                            .fill(pageNum == 2 ? Color.blueBtn : Color.blueBtn.opacity(0.5))
                                            .frame(width: 8, height: 8)
                                            .cornerRadius(19)
                                        
                                    }
                                    
                                }
                                
                            }
                        }
                    }
                    
                }
            } else {
                if isNotificationView {
                    ZStack {
                        Color.mainBg
                            .ignoresSafeArea()
                        
                        ZStack {
                            
                            
                            VStack(spacing: 0) {
                                HStack {
                                    Spacer()
                                    Button {
                                        isNotificationView = false
                                    } label : {
                                        ZStack {
                                            Circle()
                                                .frame(width: 30 ,height: 30)
                                                .foregroundColor(.black.opacity(0.2))
                                            Image(systemName: "xmark")
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(.white)
                                        }
                                    }
                                }.padding(.horizontal)
                                ZStack {
                                    Image("notifications1923")
                                    Image("notifications2923")
                                        .padding(.top, 65)
                                }.padding(.top, 35)
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.secondBg).edgesIgnoringSafeArea(.bottom)
                                        .frame(height: 300)
                                    
                                    VStack {
                                        VStack(spacing: 12) {
                                            Text("Don’t miss anything")
                                                .font(.title)
                                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                .multilineTextAlignment(.center)
                                            Text("Don’t miss the most userful information")
                                                .font(.system(size: 15, weight: .semibold))
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.gray.opacity(0.5))
                                        }.padding(.horizontal, 30).padding(.bottom, 10).frame(height: 100).foregroundColor(.white)
                                        
                                        
                                        
                                        Spacer()
                                        Button {
                                            isNotificationView = false
                                            onboardingShowed = true
                                        } label: {
                                            
                                            Text("Next")
                                                .foregroundColor(Color.white)
                                                .font(.system(size: 15))
                                                .padding()
                                                .frame(maxWidth: .infinity)
                                        }.frame(height: 50).background(Color.blueBtn)
                                            .cornerRadius(16).padding(.horizontal).padding(.bottom, 50)
                                    }
                                }
                            }
                        }
                    }
                    
                } else {
                    WUIView()
                }
            }
        } else {
            WUIView()
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
                isLoadingView.toggle()
            }
        }
    }
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
}

#Preview {
    UsOnboardingUIView()
}
