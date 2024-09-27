//
//  SettingsViewModel.swift
//  app923
//
//  Created by Dias Atudinov on 17.09.2024.
//

import SwiftUI
import StoreKit

class SettingsViewModel: ObservableObject {
    
    
    func shareApp() {
        guard let url = URL(string: "https://apps.apple.com/us/app/pocket-beauty/id6723889087") else { return }
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
    
    func openUsagePolicy() {
        guard let url = URL(string: "https://www.termsfeed.com/live/5ce4059c-64b2-4ad5-b6bc-b937a7c90837") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
