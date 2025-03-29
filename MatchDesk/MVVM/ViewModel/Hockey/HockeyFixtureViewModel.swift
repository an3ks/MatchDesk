//
//  HockeyFixtureViewModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 29.03.2025.
//

import Foundation
import SwiftUI

class HockeyFixturesViewModel: ObservableObject {
    @Published var hockeyFixtures: [Fixture] = []
    init() {
        fetchHockeyFixtures()
    }
    func fetchHockeyFixtures() {
        if !hockeyFixtures.isEmpty {return}
        let leagueIDs = ["4380", "4920"]
        for id in leagueIDs {
            let urlStr = "https://www.thesportsdb.com/api/v1/json/3/eventsseason.php?id=\(id)&s=2024-2025"
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
                    let decodedData = try JSONDecoder().decode(HockeyFixturesResponse.self, from: data)
                    let sorted = decodedData.events.sorted {
                        ($0.dateEvent) > ($1.dateEvent)}
                    let top5 = Array(sorted.prefix(5))
                    DispatchQueue.main.async {
                        self.hockeyFixtures.append(contentsOf: top5)
                        print("Данные матчей загружены")
                    }
                } catch {
                    print("Ошибка парсинга матчей: \(error.localizedDescription)")
                }
            }.resume()
        }
    }
    struct HockeyFixturesResponse: Codable {
        let events: [Fixture]
    }
}


