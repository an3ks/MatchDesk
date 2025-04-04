//
//  LeagueLogoView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 13.03.2025.
//

import SwiftUI

struct LeagueLogoView: View {
    let league: League
    var body: some View {
        ZStack{   
            AsyncImage(url: URL(string: league.logo)){ image in
                image.resizable()
                    .frame(width: 25, height: 25)
                    .scaledToFit()
                
            } placeholder: {
                ProgressView()
            }
            
        }
        .frame(width: 30, height: 30)
    }
}
