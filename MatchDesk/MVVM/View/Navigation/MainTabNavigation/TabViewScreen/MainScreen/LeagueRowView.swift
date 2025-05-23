//
//  DefaultRowView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 18.03.2025.
//

import SwiftUI


struct defaultRowView: View {
    let league: League
    @Binding var sportSelectedIndex: Int
    @State private var isExpanded = false
    
    var body: some View {
            VStack(alignment: .leading){
                HStack {
                    AsyncImage(url: URL(string: league.logo)) { image in
                        LeagueLogoView(league: league)
                            .frame(width: 30, height: 30)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 30, height: 30)
                    
                    Text(league.name)
                        .font(.custom("HelveticaNeue-Light", size: 17))
                        .foregroundColor(Color.BlackAndWhiteColor)
                        .padding(.leading, 10)
                    
                    Spacer()
                }
                .padding(.leading, 15)
                .padding(.vertical, 10)
                if isExpanded {
                    HStack{
                        VStack (alignment: .leading){
                            Text("Founded: \(league.founded)")
                                .padding(.bottom, 10)
                            Text("Country: \(league.country)")
                        }
                        .foregroundColor(Color.BlackAndWhiteColor)
                        .font(.custom("HelveticaNeue-Light", size: 13))
                        Spacer()
                        if sportSelectedIndex == 1{
                            NavigationLink(destination: LeagueStandingsView(league: league))
                            {
                                LeagueBtnView().padding(.trailing, 15)
                            } }
                        else{
                            NavigationLink(destination: LeagueStandingsView(league: league))
                            {
                                LeagueBtnView().padding(.trailing, 15)
                            }
                        }
                    }
                    .padding()
                    .padding(.bottom, 10)
                    .cornerRadius(30)
                }
                
            }
            .frame(minWidth: UIScreen.main.bounds.width * 0.8, maxWidth: UIScreen.main.bounds.width * 0.8, minHeight: 15)
            .background(Color.RowColor.opacity(0.3))
            .cornerRadius(30)
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }
    }


#Preview {
    defaultRowView( league: League(id: "11", name: "English Premier League", country: "England", logo: "https://www.thesportsdb.com/images/media/league/badge/gasy9d1737743125.png", founded: "1905"), sportSelectedIndex: .constant(2))
}
