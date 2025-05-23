//
//  MainScreenLeagueView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 13.03.2025.
//
import SwiftUI

struct MainScreenFootballView: View {
    @StateObject private var footballLeagueViewModel = FootballLeagueViewModel()
    @StateObject private var fixturesViewModel = FootballFixturesViewModel()
    @Binding var sportSelectedIndex: Int
    
    var body: some View {
        
            ScrollView {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(fixturesViewModel.footballFixtures, id: \.id) { fixture in
                                FixtureView(fixture: fixture)
                            }
                            .padding(.vertical, 3)
                        }
                        .safeAreaInset(edge: .leading) {
                            Color.clear.frame(width: 20)
                        }
                        .safeAreaInset(edge: .trailing) {
                            Color.clear.frame(width: 30)
                        }
                    }
                    .scrollIndicators(.hidden)
                    VStack(spacing: 15) {
                        ForEach(footballLeagueViewModel.footballFeagues, id: \.id) { league in
                            defaultRowView(league: league, sportSelectedIndex: $sportSelectedIndex)
                                .padding(.horizontal, 16)
                                .frame(minWidth: UIScreen.main.bounds.width * 0.8, maxWidth: UIScreen.main.bounds.width * 0.8, minHeight: 15)
                                .background(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.BlackAndWhiteColor.opacity(0.4), lineWidth: 1)
                                )
                        }
                    }
                    .padding(.top, 30)
                }
            }
            .safeAreaInset(edge: .top){
                TopOverlay(SportSelectedIndex: $sportSelectedIndex)
            }

            .scrollIndicators(.hidden)
        }
    }

#Preview {
    MainScreenFootballView(sportSelectedIndex: .constant(1))
        .preferredColorScheme(.dark)
}

