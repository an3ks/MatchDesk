//
//  FLeagueStandings.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 30.03.2025.
//

import SwiftUI

struct LeagueStandingsView: View {
    let league: League
    @StateObject var standingsViewModel: FStadingsViewModel
    
    init(league: League) {
        self.league = league
        _standingsViewModel = StateObject(wrappedValue: FStadingsViewModel(leagueId: league.id))
    }
    
    var body: some View {
            List {
                HStack(spacing:30){
                    AsyncImage(url: URL(string: league.logo)){image in
                        image.resizable()
                            .frame(width:60, height:60)
                            .scaledToFit()
                    }placeholder: {
                        ProgressView()
                    }
                    Text(league.name)
                        .font(.custom("HelveticaNeue-Light", size: 25))
                }
                .padding(.leading, 30)
                .listRowSeparator(.hidden)
                Section(header: headerView) {
                    ForEach(standingsViewModel.standings) { standing in
                        rowView(for: standing)
                    }
                }
            }
            .scrollIndicators(.hidden)
//            .navigationBarBackButtonHidden(true)
            
            .listStyle(PlainListStyle())
    }
    
    private var headerView: some View {
        HStack {
            Text("№").frame(maxWidth: .infinity)
            Text("Team").frame(width: 130)
            Text("Pts").frame(maxWidth: .infinity)
            Text("P").frame(maxWidth: .infinity)
            Text("W").frame(maxWidth: .infinity)
            Text("D").frame(maxWidth: .infinity)
            Text("L").frame(maxWidth: .infinity)
        }
        .font(.custom("HelveticaNeue-Light", size: 18))
        .foregroundStyle(Color.bottomBarTextClr)
        .padding(.vertical, 5)
    }
    
    private func rowView(for standing: LeagueStanding) -> some View {
        HStack {
            Text(standing.position).frame(maxWidth: .infinity)
            HStack(spacing: 1){
                AsyncImage(url: URL(string: standing.teamLogo)){image in
                    image.resizable()
                        .frame(width:30, height:30)
                        .scaledToFit()
                }placeholder: {
                    ProgressView()
                }
                Text(standing.teamName).frame(width: 100)
                    .multilineTextAlignment(.center)
            }
            Text(standing.points).frame(maxWidth: .infinity)
            Text(standing.played).frame(maxWidth: .infinity)
            Text(standing.won).frame(maxWidth: .infinity)
            Text(standing.drawn).frame(maxWidth: .infinity)
            Text(standing.lost).frame(maxWidth: .infinity)
        }.frame(height: 50)
        .font(.custom("HelveticaNeue-Light", size: 16))
        .padding(.vertical, 5)
        .background(Color.RowColor.opacity(0.3))
        .cornerRadius(10)
    }
}

#Preview {
    LeagueStandingsView(league: League(id: "4328", name: "English Premier League", country: "England", logo: "https://www.thesportsdb.com/images/media/league/badge/gasy9d1737743125.png", founded: "1888"))

}
