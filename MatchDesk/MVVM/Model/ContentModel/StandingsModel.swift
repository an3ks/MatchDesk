//
//  StandingsModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 30.03.2025.
//

import Foundation

struct LeagueStanding: Identifiable, Codable {
    let id: String
    let position: String
    let points: String
    let played: String
    let won: String
    let drawn: String
    let lost: String
    let goalsFor: String
    let goalsAgainst: String
    let goalDifference: String
    let teamName: String
    let teamLogo: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idStanding"
        case position = "intRank"
        case points = "intPoints"
        case played = "intPlayed"
        case won = "intWin"
        case drawn = "intDraw"
        case lost = "intLoss"
        case goalsFor = "intGoalsFor"
        case goalsAgainst = "intGoalsAgainst"
        case goalDifference = "intGoalDifference"
        case teamName = "strTeam"
        case teamLogo = "strBadge"
    }
}
