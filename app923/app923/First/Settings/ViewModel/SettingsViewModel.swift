//
//  SettingsViewModel.swift
//  app923
//
//  Created by Dias Atudinov on 17.09.2024.
//

import SwiftUI
import StoreKit

class SettingsViewModel: ObservableObject {
    
    @Published var awards: [Award] = []{
        didSet {
            saveProduct()
        }
    }
    
    private let productsFileName = "awards.json"
    
    init() {
        loadProduct()
    }
    
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func productsFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(productsFileName)
    }
    
    private func saveProduct() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.awards)
                try data.write(to: self.productsFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    
    private func loadProduct() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: productsFilePath())
            awards = try decoder.decode([Award].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
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
