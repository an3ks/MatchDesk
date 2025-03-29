//
//  LeagueViewModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 09.03.2025.
//

import Foundation

class FootballLeagueViewModel: ObservableObject {
    @Published var footballFeagues: [League] = []
    private var isLoaded = false
    
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        if !footballFeagues.isEmpty { return }
        if let url = Bundle.main.url(forResource: "FootballLeagues", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let decoded = try? JSONDecoder().decode([String: [League]].self, from: data) {
            DispatchQueue.main.async {
                self.footballFeagues = decoded["leagues"] ?? []
                print("JSON загружен")
            }
        } else {
            print("Ошибка загрузки JSON")
        }
    }
}
