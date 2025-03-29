//
//  MainScreenHockeyView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 29.03.2025.
//

import SwiftUI

struct MainScreenHockeyView: View {
    @StateObject private var hockeyLeagueViewModel = HockeyLeagueViewModel()
    @StateObject private var hockeyFixturesViewModel = HockeyFixturesViewModel()
    var body: some View {
        ScrollView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(hockeyFixturesViewModel.hockeyFixtures, id: \.id) { fixture in
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
                    ForEach(hockeyLeagueViewModel.hockeyLeagues, id: \.id) { league in
                        defaultRowView(league: league)
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
        .scrollIndicators(.hidden)
    }
}

#Preview {
    MainScreenHockeyView()
}
