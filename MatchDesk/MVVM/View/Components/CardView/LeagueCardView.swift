//
//  LeagueCardView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 11.03.2025.
//

import SwiftUI

struct LeagueCardView: View {
    let league1: League
    var body: some View {
        ZStack{
            LeagueCardBodyView(league: league1)
            LeagueCardContentView(league: league1)
        }
        .frame(width: 175, height: 190)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    LeagueCardView(league1: League(id: "11", name: "English Premier League", country: "England", logo: "https://www.thesportsdb.com/images/media/league/badge/gasy9d1737743125.png"))
        .preferredColorScheme(.dark)
}

