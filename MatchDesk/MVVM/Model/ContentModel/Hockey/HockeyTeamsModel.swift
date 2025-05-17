//
//  HockeyTeamsModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 17.05.2025.
//

import Foundation

struct TeamsResponse: Codable {
    let table: [Team]
}

struct Team: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let logoURL: String

    enum CodingKeys: String, CodingKey {
        case id = "idTeam"
        case name = "strTeam"
        case country = "strCountry"
        case logoURL = "strTeamBadge"
    }
}
