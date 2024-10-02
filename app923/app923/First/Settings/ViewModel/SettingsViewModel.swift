//
//  SettingsViewModel.swift
//  app923
//
//  Created by Dias Atudinov on 17.09.2024.
//

import SwiftUI
import StoreKit

class SettingsViewModel: ObservableObject {
    
    @Published var awards: [Award] = [Award(name: "The most brilliant beard", title: "Win a competition among other friends, take care of your vegetation and win", date: Date()), Award(name: "The most brilliant beard", title: "Win a competition among other friends, take care of your vegetation and win", date: Date())]
    
    
    func addAward(_ award: Award) {
        awards.append(award)
    }
    
    func awardCheckToggle(_ award: Award) {
        if let index = awards.firstIndex(where: { $0.id == award.id }) {
            awards[index].isChecked.toggle()
        }
    }
    func editAward(_ award: Award, image: UIImage?, name: String, title: String, date: Date) {
        if let index = awards.firstIndex(where: { $0.id == award.id }) {
            awards[index].image = image
            awards[index].name = name
            awards[index].title = title
            awards[index].date = date
        }
    }
    func deleteAward(_ award: Award){
        if let index = awards.firstIndex(where: { $0.id == award.id }) {
            awards.remove(at: index)
        }
    }
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
    
    func openLink() {
        guard let url = URL(string: "https://www.termsfeed.com/live/5ce4059c-64b2-4ad5-b6bc-b937a7c90837") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
