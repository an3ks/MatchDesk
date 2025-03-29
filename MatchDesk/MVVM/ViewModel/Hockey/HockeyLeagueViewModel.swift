//
//  HockeyLeagueViewModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 29.03.2025.
//

import Foundation

class HockeyLeagueViewModel: ObservableObject {
    @Published var hockeyLeagues: [League] = []
    private var isLoaded = false
    init() {
        loadMockData()
    }
    private func loadMockData() {
        if !hockeyLeagues.isEmpty {return}
        if let url = Bundle.main.url(forResource: "HockeyLeagues", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let decoded = try? JSONDecoder().decode([String: [League]].self, from: data) {
            DispatchQueue.main.async {
                self.hockeyLeagues = decoded["leagues"] ?? []
                print("JSON загружен")
            }
        } else {
            print("Ошибка загрузки JSON")
        }
    }
}
