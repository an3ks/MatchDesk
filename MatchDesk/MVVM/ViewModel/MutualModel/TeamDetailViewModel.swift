//
//  TeamDetailModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 15.05.2025.
//

import Foundation

class TeamDetailViewModel: ObservableObject { 
    @Published var teamDetails: TeamDetailModel?
    init(teamName: String) {
            
        }
    func teamDetails(for Name: String){
        print("ПОИСК ДЕТАЛЕЙ КОМАНДЫ")
        let underscoreName = Name.replacingOccurrences(of: " ", with: "_")
        let urlString = "https://www.thesportsdb.com/api/v1/json/3/searchteams.php?t=\(underscoreName)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Ошибка загрузки: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Нет данных")
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(TeamResponse.self, from: data)
                DispatchQueue.main.async {
                    self.teamDetails = decoded.teams.first
                    print("Команда найдена")
                }
            } catch {
                print("Ошибка парсинга: \(error.localizedDescription)")
            }
        }.resume()
        
    }
}
