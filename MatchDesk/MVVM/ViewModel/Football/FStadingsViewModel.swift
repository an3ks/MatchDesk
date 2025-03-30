//
//  FStadingsViewModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 30.03.2025.
//

import Foundation
import SwiftUI

class FStadingsViewModel: ObservableObject {
    @Published var standings: [LeagueStanding] = []
    private var leagueID: String
    
    init(leagueId: String){
        self.leagueID = leagueId
        fetchStandings()
    }
    
    func fetchStandings(){
        let urlString = "https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=\(leagueID)&s=2024-2025"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Ошибка загрузки: \(error.localizedDescription)")
                return
            }
            guard let data = data else{
                print( "Нет данных")
                return
            }
            do{
                let decoded = try JSONDecoder().decode(StandingsResponse.self, from: data)
                DispatchQueue.main.async{
                    self.standings = decoded.table
                    print("Таблица загружена")
                }
            } catch{
                print("Ошибка парсинга: \(error.localizedDescription)")
            }
        }.resume()
    }
}
struct StandingsResponse: Codable {
    let table: [LeagueStanding]
}
