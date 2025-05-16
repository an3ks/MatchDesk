//
//  TeamDetailModel.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 15.05.2025.
//

import Foundation

struct TeamDetailModel: Identifiable, Codable {
    let id: String
    let teamName: String
    let teamLogo: String
    let cmpt: String
    let cmpt2: String
    let cmpt3: String
    let cmpt4: String
    let cmpt5: String
    let cmpt6: String
    let cmpt7: String
    let fanName: String
    let color1: String
    let color2: String
    let website: String
    let twitter: String
    let facebook: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "idTeam"
        case teamName = "strTeam"
        case teamLogo = "strBadge"
        case cmpt = "strLeague"
        case cmpt2 = "strLeague2"
        case cmpt3 = "strLeague3"
        case cmpt4 = "strLeague4"
        case cmpt5 = "strLeague5"
        case cmpt6 = "strLeague6"
        case cmpt7 = "strLeague7"
        case fanName = "strKeywords"
        case color1 = "strColour1"
        case color2 = "strColour2"
        case website = "strWebsite"
        case twitter = "strTwitter"
        case facebook = "strFacebook"
        
    }
}
struct TeamResponse: Codable {
    let teams: [TeamDetailModel]
}
