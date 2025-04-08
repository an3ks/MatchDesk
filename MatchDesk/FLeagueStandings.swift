//
//  FLeagueStandings.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 30.03.2025.
//

import SwiftUI

struct LeagueStandingsView: View {
    let league: League
    @Environment(\.dismiss) var dismiss
    @State private var sportSelectedIndex = 3
    @StateObject var standingsViewModel: FStadingsViewModel
    
    init(league: League) {
        self.league = league
        _standingsViewModel = StateObject(wrappedValue: FStadingsViewModel(leagueId: league.id))
    }
    
    var body: some View {
        
            List {
                Section(header: headerView) {
                    ForEach(standingsViewModel.standings) { standing in
                        rowView(for: standing)
                    }
                }
            }
            .padding(.top, -10)
            .scrollIndicators(.hidden)
        .listStyle(PlainListStyle())
        
        .safeAreaInset(edge: .top){
            ZStack(alignment: .trailing){
                Rectangle()
                    .fill(Color.mainAccentColor)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.147)
                Spacer()
                HStack(alignment: .center){
                    Button(action: {
                        dismiss()
                    },
                           label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .padding(.leading, 30)
                        //                            .padding(.top, 35)
                            .foregroundStyle(Color.WhiteAndBlackColor)
                    })
                    Spacer()
                    
                        Text(league.name)
                            .font(.custom("HelveticaNeue-Light", size: 23))
                            .foregroundStyle(Color.WhiteAndBlackColor)
                            .multilineTextAlignment(.center)
                            .frame(width: 170)
                    Spacer()
                        AsyncImage(url: URL(string: league.logo)){image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width:60, height:60)
                                .padding(.trailing, 39)
                        }
                        placeholder: {
                            ProgressView()
                        }
                        .padding(.trailing, 39)
                        .frame(width:60, height:60)
                }
                .padding(.top, 50)
            }
        }
            .safeAreaInset(edge: .bottom) { // Отступ снизу
                Color.clear.frame(height: 30)
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
    }
    
    private var headerView: some View {
        HStack (spacing: 7) {
            Text("№").frame(width: UIScreen.main.bounds.width*0.07)
            Text("Team").frame(width: UIScreen.main.bounds.width*0.39, alignment: .center)
            Text("Pts").frame(width: UIScreen.main.bounds.width*0.07)
            Text("P").frame(width: UIScreen.main.bounds.width*0.07)
            Text("W").frame(width: UIScreen.main.bounds.width*0.07)
            Text("D").frame(width: UIScreen.main.bounds.width*0.07)
            Text("L").frame(width: UIScreen.main.bounds.width*0.07)
        }
        .font(.custom("HelveticaNeue-Light", size: 18))
        .foregroundStyle(Color.bottomBarTextClr)
        .padding(.vertical, 5)
        .frame(width: UIScreen.main.bounds.width * 0.9)
    }
    
    private func rowView(for standing: LeagueStanding) -> some View {
        HStack {
            Text(standing.position).frame(width: UIScreen.main.bounds.width*0.07)
            HStack(spacing: 7){
                AsyncImage(url: URL(string: standing.teamLogo)){image in
                    image.resizable()
                        .frame(width:30, height:30)
                        .scaledToFit()
                }placeholder: {
                    ProgressView()
                        .frame(width:30, height:30)
                }
                Text(standing.teamName).frame(width: UIScreen.main.bounds.width*0.28)
                    .multilineTextAlignment(.center)
            }
            HStack(){
                Text(standing.points).frame(width: UIScreen.main.bounds.width*0.07)
                Text(standing.played).frame(width: UIScreen.main.bounds.width*0.07)
                Text(standing.won).frame(width: UIScreen.main.bounds.width*0.07)
                Text(standing.drawn).frame(width: UIScreen.main.bounds.width*0.07)
                Text(standing.lost).frame(width: UIScreen.main.bounds.width*0.07)
            }
        }.frame(width: UIScreen.main.bounds.width*0.95, height: 50)
        .font(.custom("HelveticaNeue-Light", size: 16))
        .padding(.vertical, 5)
        .background(Color.RowColor.opacity(0.3))
        .cornerRadius(10)
    }
}

#Preview {
    LeagueStandingsView(league: League(id: "4328", name: "English Premier League", country: "England", logo: "https://www.thesportsdb.com/images/media/league/badge/gasy9d1737743125.png", founded: "1888"))
        .onAppear()

}
