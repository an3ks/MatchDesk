//
//  LeagueCardBodyView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 13.03.2025.
//

import SwiftUI

struct LeagueCardBodyView: View {
    let league: League
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 175, height: 190)
                .foregroundStyle(Color.bottomBarColor)
            ZStack(alignment: .center){
                Rectangle()
                    .foregroundStyle(Color.clear)
                Image("Grass")
                    .resizable()
                    .blur(radius: 1.5)
                LeagueLogoView(league: league)
            }
            .offset(y:-65)
            .frame(width: 175, height: 60)
        }
    }
}
