//
//  LeagueViewModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 09.03.2025.
//

import Foundation

class LeagueViewModel: ObservableObject {
    @Published var leagues: [League] = []
    
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        if let url = Bundle.main.url(forResource: "FootballLeagues", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let decoded = try? JSONDecoder().decode([String: [League]].self, from: data) {
            DispatchQueue.main.async {
                self.leagues = decoded["leagues"] ?? []
                print("JSON загружен: \(self.leagues)")
            }
        } else {
            print("Ошибка загрузки JSON")
        }
    }
}
