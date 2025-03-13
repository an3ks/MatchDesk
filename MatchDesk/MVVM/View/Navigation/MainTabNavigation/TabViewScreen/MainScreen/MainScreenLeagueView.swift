//
//  MainScreenLeagueView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 13.03.2025.
//

import SwiftUI

struct MainScreenLeagueView: View {
    @StateObject private var cardViewModel = LeagueViewModel()
    var body: some View {
        ScrollView(){
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 100)), count: 2)) {
                ForEach(cardViewModel.leagues) { league in
                    LeagueCardView(league1: league)
                        
                }
            }
        }.frame(height: 450)
    }
}
#Preview {
    MainScreenLeagueView()
}
