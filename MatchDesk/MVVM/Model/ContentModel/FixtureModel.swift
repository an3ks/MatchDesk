//
//  FixtureModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 19.03.2025.
//

import Foundation

struct Fixture: Identifiable, Codable {
    let id: String
    let leagueName: String
    let leagueLogo: String?
    let homeName: String
    let awayName: String
    let homeScore: String?
    let awayScore: String?
    let dateEvent: String
    let homeLogo: String?
    let awayLogo: String?
    let venue: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idEvent"
        case leagueName = "strLeague"
        case leagueLogo = "strLeagueBadge"
        case homeName = "strHomeTeam"
        case awayName = "strAwayTeam"
        case homeScore = "intHomeScore"
        case awayScore = "intAwayScore"
        case dateEvent
        case homeLogo = "strHomeTeamBadge"
        case awayLogo = "strAwayTeamBadge"
        case venue = "strVenue"
    }
}
