//
//  MainTabView.swift
//  MatchDesk
//
//  Created by Данила Авдиенко on 04.03.2025.
//

import SwiftUI

struct MainTabView: View {
    @Binding var selectedTab: Int
    @Binding var selectedSport: Int
    @ObservedObject var viewModel: TeamDetailViewModel
    @ObservedObject var fixtureViewModel: teamFixtureViewModel
    var body: some View {
        
        TabView(selection: $selectedTab){
            ZStack{
                if selectedSport == 1{
                    MainScreenFootballView(sportSelectedIndex: $selectedSport)
                        .background(Color.BackgroundColor)
                    .safeAreaInset(edge: .bottom) { // Отступ снизу
                        Color.clear.frame(height: 10)
                    }
                }
                else{
                    MainScreenHockeyView(sportSelectedIndex: $selectedSport)
                        .background(Color.BackgroundColor)
                    .safeAreaInset(edge: .bottom) { // Отступ снизу
                        Color.clear.frame(height: 10)
                    }
                    
                }
            }
            .tag(1)
            
            favouriteTeamView(viewModel: viewModel, fixtureViewModel: fixtureViewModel)
            .tag(2)
            
            
            SettingsView()
            
            .tag(3)
        }
    }
}

//#Preview {
//    MainTabView(selectedTab: .constant(1), selectedSport: .constant(2))
//}
