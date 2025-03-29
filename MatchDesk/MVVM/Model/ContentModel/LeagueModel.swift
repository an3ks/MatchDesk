//
//  LeagueModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 09.03.2025.
//

import Foundation

struct League: Identifiable, Codable {
    let id: String
    let name: String
    let country: String
    let logo: String
    let founded: String

    enum CodingKeys: String, CodingKey {
        case id = "idLeague"
        case name
        case country
        case logo
        case founded = "founded"
    }
}
