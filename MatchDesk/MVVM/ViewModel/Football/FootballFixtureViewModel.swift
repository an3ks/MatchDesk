//
//  FootballFixtureViewModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 19.03.2025.
//

import Foundation
import SwiftUI

class FootballFixturesViewModel: ObservableObject {
    @Published var footballFixtures: [Fixture] = []
    private var isLoaded = false
    init() {
        fetchFootballFixtures()
    }
    func fetchFootballFixtures() {
        if !footballFixtures.isEmpty {return}
        let leagueIDs = ["4335", "4334", "4331", "4332", "4355", "4346", "4328"]
        for id in leagueIDs {
            let urlStr = "https://www.thesportsdb.com/api/v1/json/3/eventsround.php?id=\(id)&r=29&s=2024-2025"
            guard let url = URL(string: urlStr) else { return }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Ошибка загрузки матчей \(error.localizedDescription)")
                    return
                }
                guard let data = data else {
                    print("Данные матчей НЕ загружены")
                    return }
                
                do {
                    let decodedData = try JSONDecoder().decode(FootballFixturesResponse.self, from: data)
                    let sorted = decodedData.events.sorted { $0.dateEvent < $1.dateEvent }
                    let top2 = Array(sorted.prefix(2))
                    DispatchQueue.main.async {
                        self.footballFixtures.append(contentsOf: top2)
                        print("Данные матчей загружены")
                    }
                } catch {
                    print("Ошибка парсинга матчей: \(error.localizedDescription)")
                }
            }.resume()
        }
    }
    
    struct FootballFixturesResponse: Codable {
        let events: [Fixture]
    }
}
