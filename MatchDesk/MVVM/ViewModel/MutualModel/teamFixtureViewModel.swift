//
//  teamFixtureViewModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 16.05.2025.
//

import Foundation


class teamFixtureViewModel: ObservableObject {
    @Published var teamFixtures: [Fixture] = []
    private var isLoaded = false
    init(teamId: String) {
        fetchTeamFixtures(for: teamId)
    }
    func fetchTeamFixtures(for teamId: String) {
        print("Загрузка матчей команды пошла")
            let urlStr = "https://www.thesportsdb.com/api/v1/json/3/eventslast.php?id=\(teamId)"
            guard let url = URL(string: urlStr) else { return }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Ошибка загрузки матчейткоманды \(error.localizedDescription)")
                    return
                }
                guard let data = data else {
                    print("Данные матчей команды НЕ загружены")
                    return }
                
                do {
                    print(String(data: data, encoding: .utf8) ?? "нет строки")
                    let decodedData = try JSONDecoder().decode(TeamFixturesResponse.self, from: data)
                    let sorted = decodedData.results.sorted { $0.dateEvent < $1.dateEvent }
                    
                    DispatchQueue.main.async {
                        self.teamFixtures = sorted
                        print("Данные матчей команды загружены")
                    }
                } catch {
                    print("Ошибка парсинга матчей команды: \(error.localizedDescription)")
                }
            }.resume()
        
    }
    
    struct TeamFixturesResponse: Codable {
        let results: [Fixture]
    }
}
