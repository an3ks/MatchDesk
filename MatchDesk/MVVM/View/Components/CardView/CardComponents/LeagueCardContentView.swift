//
//  LeagueCardContentView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 13.03.2025.
//

import SwiftUI

struct LeagueCardContentView: View {
    let league: League
    var body: some View {
        VStack(alignment: .leading){
            Text(league.name)
                .foregroundStyle(Color.mainAccentColor)
                .font(.system(size: 17, weight: .bold, design: .default))
                .frame(width: 150, height: 70)
                .offset(x: -13, y: 55)
            
            Spacer()
            
            HStack{
                Text("\(league.country)")
                    .foregroundStyle(Color.mainAccentColor)
                    .padding(.top, 10)
                    .frame(width: 70, height: 30)
                    .font(.system(size: 13, weight: .light, design: .default))
                    .offset(x: -13)
                Button{}
                label:{
                    LeagueBtnView()
                        .padding(.leading, 30)
                }
            }
            .padding(.bottom, 10)
        }
    }
}
